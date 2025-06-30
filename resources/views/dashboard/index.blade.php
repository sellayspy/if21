@extends('main')

@section('title', 'Dashboard')

@section('content')

<!-- html -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<div class="row">
    <div class="col-lg-6">
        <figure class="highcharts-figure">
            <div id="container"></div>
        </figure>
    </div>
    <div class="col-lg-6">
        <figure class="highcharts-figure">
            <div id="container-asalsma"></div>
        </figure>
    </div>
</div>
<div class="row">
    <div class="col-lg-6">
        <figure class="highcharts-figure">
            <div id="container-pertahun"></div>
        </figure>
    </div>
    <div class="col-lg-6">
        <figure class="highcharts-figure">
            <div id="container-kelas-pertahun"></div>
        </figure>
    </div>
</div>

<!-- css -->
 <style>
    .highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tbody tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

.highcharts-description {
    margin: 0.3rem 10px;
}

 </style>

<!-- javascript -->
<script>
Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Jumlah Mahasiswa Berdasarkan Program Studi'
    },
    subtitle: {
        text:
            'Source: Universitas MDP'
    },
    xAxis: {
        categories: [
            @foreach ($mahasiswaprodi as $item)
                ' {{ $item->nama }} ',
            @endforeach
        ],
        crosshair: true,
        accessibility: {
            description: 'Program Studi'
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Mahasiswa'
        }
    },
    tooltip: {
        valueSuffix: ' (Orang)'
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [
        {
            name: 'Mahasiswa',
            data: [
                @foreach ($mahasiswaprodi as $item)
                {{ $item->jumlah }},
                @endforeach
            ]
        }
    ]
});

Highcharts.chart('container-asalsma', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Jumlah Mahasiswa Berdasarkan Asal SMA'
    },
    subtitle: {
        text:
            'Source: Universitas MDP'
    },
    xAxis: {
        categories: [
            @foreach ($mahasiswaasalsma as $item)
                ' {{ $item->asal_sma }} ',
            @endforeach
        ],
        crosshair: true,
        accessibility: {
            description: 'Program Studi'
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Mahasiswa'
        }
    },
    tooltip: {
        valueSuffix: ' (Orang)'
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [
        {
            name: 'Mahasiswa',
            data: [
                @foreach ($mahasiswaasalsma as $item)
                {{ $item->jumlah }},
                @endforeach
            ]
        }
    ]
});

Highcharts.chart('container-pertahun', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Jumlah Mahasiswa Berdasarkan per Tahun Masuk'
    },
    subtitle: {
        text:
            'Source: Universitas MDP'
    },
    xAxis: {
        categories: [
            @foreach ($mahasiswapertahun as $item)
                ' 20{{ $item->tahun }} ',
            @endforeach
        ],
        crosshair: true,
        accessibility: {
            description: 'Tahun Masuk'
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Mahasiswa'
        }
    },
    tooltip: {
        valueSuffix: ' (Orang)'
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [
        {
            name: 'Mahasiswa',
            data: [
                @foreach ($mahasiswapertahun as $item)
                {{ $item->jumlah }},
                @endforeach
            ]
        }
    ]
});

Highcharts.chart('container-kelas-pertahun', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Jumlah Kelas yang Dibuka per Prodi per Tahun Akademik'
    },
    subtitle: {
        text: 'Source: Universitas MDP'
    },
    xAxis: {
        categories: [
            @foreach ($tahunList as $item)
                ' {{$item}} ',
            @endforeach
        ],
        crosshair: true,
        accessibility: {
            description: 'Tahun Akademik'
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Jumlah Kelas'
        }
    },
    tooltip: {
        valueSuffix: 'Kelas'
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [
        @foreach ($group as $prodi => $data)
            {
                name: '{{ $prodi }}',
                data: [
                    @foreach ($tahunList as $item)
                        {{ isset($data[$item]) ? $data[$item] : 0 }},
                    @endforeach
                ]
            },
        @endforeach
    ]
});


</script>

@endsection
