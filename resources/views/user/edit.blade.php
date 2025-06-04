@extends('main')

@section('title', 'Fakultas')
@section('content')
    <!--begin::Row-->
    <div class="row">
        <div class="col-12">
            {{-- form tambah fakultas --}}
            <div class="card card-primary card-outline mb-4">
                  <!--begin::Header-->
                  <div class="card-header"><div class="card-title">Form Ubah Fakultas</div></div>
                  <!--end::Header-->
                  <!--begin::Form-->
                  <form action="{{ route('fakultas.update', $fakultas->id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    <!--begin::Body-->
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="nama" class="form-label">Nama User</label>
                        <input type="text" id="nama" class="form-control" name="nama" value="{{ old('nama', $fakultas->nama) }}">
                      </div>

                      <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" class="form-control" name="email" value="{{ old('email', $fakultas->email) }}">
                      </div>
                    </div>
                    <!--end::Body-->

                    <!--begin::Footer-->
                    <div class="card-footer">
                      <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                    <!--end::Footer-->
                  </form>

                  <!--end::Form-->
            </div>
        </div>
    </div>
    <!--end::Row-->
@endsection
