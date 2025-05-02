<h1>Program Studi</h1>

@foreach ($prodi as $item)
    {{ $item->nama }} {{ $item->kaprodi }}
@endforeach