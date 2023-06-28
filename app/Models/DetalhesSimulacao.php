<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalhesSimulacao extends Model
{
    protected $table = 'detalhes_simulacoes';

    protected $fillable = [
        'montante_pedido',
        'prestacao_mensal',
        'taxa_de_juros',
        'meses_de_pagamento',
        'montante_total_a_pagar',
    ];

    public function simulacao()
    {
        return $this->belongsTo(Simulacao::class, 'simulacoes_id', 'id');
    }
}
