#INCLUDE 'totvs.ch'

#DEFINE NALUNOS 4
#DEFINE NNOTAS 3

User Function L05E16()
    local aBoletim := {}
    local cNome := " "
    local nNota, nLinha, nColuna, nMedia, nSomaNotas := 0

    for nLinha := 1 to NALUNOS
        cNome := cValToChar(fwInputBox("Digite o nome do " + cValToChar(nLinha) + "º aluno"))
        AAdd(aBoletim, cNome)
        for nColuna := 1 to NNOTAS
            nNota := Val(fwInputBox("Digite a " + cValToChar(nColuna) + "ª nota"))
            AAdd(aBoletim, nNota)
            nSomaNotas += nNota
        next

        nMedia := nSomaNotas / NNOTAS
        nSomaNotas := 0
        AAdd(aBoletim, round(nMedia, 2))
    next

    fwAlertInfo(ArrToKStr(aBoletim, CRLF), "Desempenho dos Alunos")
Return 
