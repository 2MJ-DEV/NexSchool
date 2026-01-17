<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'two_factor_secret',
        'two_factor_recovery_codes',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'two_factor_confirmed_at' => 'datetime',
        ];
    }

    /**
     * Les rôles de l'utilisateur
     */
    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class);
    }

    /**
     * Les enfants du parent (si l'utilisateur est un parent)
     */
    public function children(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'parent_student', 'parent_id', 'student_id')
            ->withPivot('relationship')
            ->withTimestamps();
    }

    /**
     * Les parents de l'élève (si l'utilisateur est un élève)
     */
    public function parents(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'parent_student', 'student_id', 'parent_id')
            ->withPivot('relationship')
            ->withTimestamps();
    }

    /**
     * Vérifier si l'utilisateur a un rôle spécifique
     */
    public function hasRole(string $roleName): bool
    {
        return $this->roles()->where('name', $roleName)->exists();
    }

    /**
     * Vérifier si l'utilisateur a l'un des rôles spécifiés
     */
    public function hasAnyRole(array $roleNames): bool
    {
        return $this->roles()->whereIn('name', $roleNames)->exists();
    }

    /**
     * Vérifier si l'utilisateur a tous les rôles spécifiés
     */
    public function hasAllRoles(array $roleNames): bool
    {
        return $this->roles()->whereIn('name', $roleNames)->count() === count($roleNames);
    }

    /**
     * Assigner un rôle à l'utilisateur
     */
    public function assignRole(string|Role $role): void
    {
        if (is_string($role)) {
            $role = Role::where('name', $role)->firstOrFail();
        }
        
        $this->roles()->syncWithoutDetaching($role);
    }

    /**
     * Retirer un rôle de l'utilisateur
     */
    public function removeRole(string|Role $role): void
    {
        if (is_string($role)) {
            $role = Role::where('name', $role)->firstOrFail();
        }
        
        $this->roles()->detach($role);
    }

    /**
     * Vérifier si l'utilisateur est un superadmin
     */
    public function isSuperAdmin(): bool
    {
        return $this->hasRole('superadmin');
    }

    /**
     * Vérifier si l'utilisateur est un admin
     */
    public function isAdmin(): bool
    {
        return $this->hasRole('admin');
    }

    /**
     * Vérifier si l'utilisateur est un enseignant
     */
    public function isTeacher(): bool
    {
        return $this->hasRole('teacher');
    }

    /**
     * Vérifier si l'utilisateur est un parent
     */
    public function isParent(): bool
    {
        return $this->hasRole('parent');
    }

    /**
     * Vérifier si l'utilisateur est un élève
     */
    public function isStudent(): bool
    {
        return $this->hasRole('student');
    }

    /**
     * Ajouter un enfant au parent
     */
    public function addChild(User $student, string $relationship = 'parent'): void
    {
        $this->children()->syncWithoutDetaching([
            $student->id => ['relationship' => $relationship]
        ]);
    }

    /**
     * Retirer un enfant du parent
     */
    public function removeChild(User $student): void
    {
        $this->children()->detach($student);
    }

    /**
     * Vérifier si l'utilisateur peut gérer cet élève
     */
    public function canManageStudent(User $student): bool
    {
        if ($this->isSuperAdmin() || $this->isAdmin()) {
            return true;
        }

        if ($this->isParent()) {
            return $this->children()->where('student_id', $student->id)->exists();
        }

        return $this->id === $student->id;
    }
}
