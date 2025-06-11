<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Materi extends Model
{
    use HasUuids;
    protected $table = 'materi';

    protected $fillable = [
        'mata_kuliah_id',
        'dosen_id',
        'pertemuan',
        'pokok_bahasan',
        'file_materi',
    ];
    public function mataKuliah()
    {
        return $this->belongsTo(MataKuliah::class, 'mata_kuliah_id');
    }
    public function dosen()
    {
        return $this->belongsTo(User::class, 'dosen_id');
    }
}
