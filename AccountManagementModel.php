<?php

namespace App\Models;

use CodeIgniter\Model;

class AccountManagementModel extends Model
{
    protected $table = 'users'; // Targeting the 'users' table for mentor and passive-investor data
    protected $primaryKey = 'id'; 
    protected $allowedFields = ['email', 'phone', 'password', 'deactivated']; // Fields to be updated
}
