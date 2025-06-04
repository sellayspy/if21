<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Sesi extends Model
{
    use HasUuids;
    protected $table = 'sesi';
    protected $fillable = [
        'id',
        'nama'
    ];
}
