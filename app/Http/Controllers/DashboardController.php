<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class DashboardController extends Controller
{
    public function index()
    {
        $mahasiswaprodi = DB::select('
            SELECT prodi.nama, COUNT(*) as jumlah
            FROM mahasiswas JOIN prodi ON mahasiswas.prodi_id = prodi.id
            GROUP BY prodi.nama
        ');

        $mahasiswaasalsma = DB::select('
            SELECT asal_sma, COUNT(*) as jumlah
            FROM mahasiswas
            GROUP BY asal_sma
        ');

        $mahasiswapertahun = DB::select('
            SELECT LEFT(npm, 2) as tahun, COUNT(*) as jumlah
            FROM mahasiswas
            GROUP BY LEFT(npm, 2)
        ');

        $kelasprodipertahun = DB::select('
            SELECT prodi.nama,jadwal.tahun_akademik, COUNT(*) as jumlah_kelas
            from Jadwal
            JOIN mata_kuliah ON jadwal.mata_kuliah_id = mata_kuliah.id
            JOIN prodi ON mata_kuliah.prodi_id = prodi.id
            GROUP BY prodi.nama, jadwal.tahun_akademik
            ORDER BY jadwal.tahun_akademik
        ');

        $group =[];
        $tahunList=[];

        foreach ($kelasprodipertahun as $kelas) {
            $group[$kelas->nama][$kelas->tahun_akademik] = $kelas->jumlah_kelas;
            $tahunList[] = $kelas->tahun_akademik;
        }

        $tahunList = array_unique($tahunList);
        sort($tahunList);

        return view('dashboard.index', [
            'mahasiswaprodi' => $mahasiswaprodi,
            'mahasiswaasalsma' => $mahasiswaasalsma,
            'mahasiswapertahun' => $mahasiswapertahun,
            'kelasprodipertahun' => $kelasprodipertahun,
            'group' => $group,
            'tahunList' => $tahunList
        ]);
    }
}
