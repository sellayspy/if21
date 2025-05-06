<h1>Mahasiswa</h1>

@foreach ($mahasiswa as $item)
    {{ $item->npm }} 
    {{ $item->nama }} 
    {{ $item->prodi->nama }}
    {{ $item->prodi->fakultas->nama }}
    <br />
@endforeach