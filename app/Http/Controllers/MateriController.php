<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use App\Models\Materi;
use App\Models\User;
use Illuminate\Http\Request;

class MateriController extends Controller
{
    public function index()
    {
        $materi = Materi::with(['mataKuliah', 'dosen'])->get();
        return view('materi.index', compact('materi'));
    }

    public function create()
    {
        $mataKuliah = MataKuliah::all();
        $dosen = User::all();;
        return view('materi.create', compact('mataKuliah', 'dosen'));
    }

    public function store(Request $request)
    {
        $validate = $request->validate([
            'mata_kuliah_id' => 'required|exists:mata_kuliah,id',
            'dosen_id' => 'required|exists:users,id',
            'pertemuan' => 'required|integer',
            'pokok_bahasan' => 'required|string|max:100',
            'file_materi' => 'required|file|mimes:pdf,doc,docx|max:10000',
        ]);
        $materi = new Materi($validate);
        if ($request->hasFile('file_materi')) {
            $file = $request->file('file_materi');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('materi', $filename, 'public');
            $materi->file_materi = $filename;
        }
        $materi->save();
        return redirect()->route('materi.index')->with('Materi berhasil ditambahkan.');
    }

    public function show($id)
    {
        // Logic to display a specific materi
        return view('materi.show', compact('id'));
    }

    public function edit($id)
    {
        $materi = Materi::findOrFail($id);
        $mataKuliah = MataKuliah::all();
        $dosen = User::all();
        return view('materi.edit', compact('materi', 'mataKuliah', 'dosen'));
    }

    public function update(Request $request, $id)
    {
        $validate = $request->validate([
            'mata_kuliah_id' => 'required|exists:mata_kuliah,id',
            'dosen_id' => 'required|exists:users,id',
            'pertemuan' => 'required|integer',
            'pokok_bahasan' => 'required|string|max:100',
            'file_materi' => 'nullable|file|mimes:pdf,doc,docx|max:10000',
        ]);

        $materi = Materi::findOrFail($id);
        $materi->fill($validate);

        if ($request->hasFile('file_materi')) {
            $file = $request->file('file_materi');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('materi', $filename, 'public');
            $materi->file_materi = $filename;
        }

        $materi->save();

        return redirect()->route('materi.index')->with('Materi berhasil diperbarui.');
    }


    public function destroy($id)
    {
        $materi = Materi::findOrFail($id);
        $materi->delete();

        return redirect()->route('materi.index')->with('Materi berhasil dihapus.');
    }
}
