<h1>Fakultas</h1>
@foreach ($fakultas as $item)
    {{ $item->nama }}
    {{ $item->singkatan }}
@endforeach