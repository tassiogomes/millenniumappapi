<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Simulacao extends Model
{
    protected $table = 'simulacoes';

    protected $fillable = [
        'users_id',
        'detalhes_simulacoes_id',
        'data_simulacao',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'users_id', 'id');
    }

    public function detalhesSimulacao()
    {
        return $this->hasOne(DetalhesSimulacao::class, 'id', 'detalhes_simulacoes_id');
    }
}