<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Simulacao;
use Illuminate\Http\Request;
use App\Models\DetalhesSimulacao;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class ApiController extends Controller
{


    public function showLogin($id)
    {
    
        //file_put_contents("show1.txt", print_r($id, true));
        $users = User::find($id);
        return response()->JSON($users);
    }


    public function register(Request $request)
    {
        // Validação dos dados recebidos
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
        ]);

        // Cria um novo usuário
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->save();

        // Retorna uma resposta de sucesso
        return response()->json(['message' => 'User registered successfully'], 200);
    }


    public function createSimulacao(Request $request)
{
    $request->validate([
        //'user_id' => 'required',
        'montante_pedido' => 'required',
        'prestacao_mensal' => 'required',
        'taxa_de_juros' => 'required',
        'meses_de_pagamento' => 'required',
        'montante_total_a_pagar' => 'required',
        'data_simulacao' => 'required',
    ]);

    // Verifica se o usuário existe
    //$user = User::find(Auth::id());
    //$user = DB::table('users')->find($request->input('user_id'));
    $user = User::find($request->id);

    /*file_put_contents("show1.txt", print_r($user, true));
    dd($user);*/
    if (!$user) {
        return response()->json(['message' => 'Usuário não encontrado'], 404);
    }

    // Cria o registro de detalhes da simulação
    $detalhesSimulacao = new DetalhesSimulacao();
    $detalhesSimulacao->montante_pedido = $request->montante_pedido;
    $detalhesSimulacao->prestacao_mensal = $request->prestacao_mensal;
    $detalhesSimulacao->taxa_de_juros = $request->taxa_de_juros;
    $detalhesSimulacao->meses_de_pagamento = $request->meses_de_pagamento;
    $detalhesSimulacao->montante_total_a_pagar = $request->montante_total_a_pagar;
    // Preencha as outras propriedades do detalhe da simulação conforme necessário
    $detalhesSimulacao->save();

    // Cria o registro de simulação associado ao usuário
    $simulacao = new Simulacao();
    $simulacao->users_id = $user->id;
    $simulacao->detalhes_simulacoes_id = $detalhesSimulacao->id;
    $simulacao->data_simulacao = $request->data_simulacao; // Use a data recebida no request
    $simulacao->save();

    return response()->json(['message' => 'Simulação criada com sucesso'], 201);
}


public function showSimulacao($userId, $simulacaoId)
{
    //$user = DB::table('users')->find($userId);
    $user = User::find($userId);
    //dd($userId, $simulacaoId); //ele entra aqui ok


    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }
    //dd($simulacaoId, $user); //ele entra aqui ok

    $simulacao = $user->simulacoes()->find($simulacaoId);
    //dd($simulacaoId, $user);

    
    if (!$simulacao) {
        return response()->json(['message' => 'Simulation not found'], 404);
    }

    $detalhesSimulacao = $simulacao->detalhesSimulacao;

    $simulacaoData = [
        'data_simulacao' => $simulacao->data_simulacao,
        'montante_pedido' => $detalhesSimulacao->montante_pedido,
        'prestacao_mensal' => $detalhesSimulacao->prestacao_mensal,
        'taxa_de_juros' => $detalhesSimulacao->taxa_de_juros,
        'meses_de_pagamento' => $detalhesSimulacao->meses_de_pagamento,
        'montante_total_a_pagar' => $detalhesSimulacao->montante_total_a_pagar,
        // Adicione outras propriedades conforme necessário
    ];

    return response()->json(['simulacao' => $simulacaoData], 200);
}


}