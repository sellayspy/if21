<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Testing\Fluent\Concerns\Has;

class Jadwal extends Model
{
    use HasUuids;
    protected $table = 'jadwal';
    protected $fillable = [
        'tahun_akademik',
        'kode_smt',
        'kelas',
        'sesi_id',
        'mata_kuliah_id',
        'dosen_id',
    ];

    public function sesi()
    {
        return $this->belongsTo(Sesi::class, 'sesi_id');
    }
    public function mataKuliah()
    {
        return $this->belongsTo(MataKuliah::class, 'mata_kuliah_id');
    }
    public function dosen()
    {
        return $this->belongsTo(User::class, 'dosen_id');
    }
}
