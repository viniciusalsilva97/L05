#INCLUDE 'totvs.ch'

#DEFINE NMAX 8

User Function L05E17()
    local aNumeros := {}
    local nResp, nSoma, nMedia := 0

    nResp := menu()   
    if nResp == 1
        vetorUsuario(aNumeros)
    else
        vetorRandomico(aNumeros)
    endif  
    exibeVetor(aNumeros, "Array Populado")
    ordenaVetor(aNumeros)
    exibeVetor(aNumeros, "Array Ordenado")
    decresceVetor(aNumeros)
    exibeVetor(aNumeros, "Array Decrescente")
    pesquisaVetor(aNumeros)
    nSoma := somaVetor(aNumeros)
    fwAlertSuccess(cValToChar(nSoma), "Valores do Array Somados")
    nMedia := mediaVetor(aNumeros, nSoma)
    fwAlertSuccess(cValToChar(nMedia), "Media dos Valores do Array")
    maiorMenor(aNumeros)
    embaralhaVetor(aNumeros)
    exibeVetor(aNumeros, "Array Embaralhado")
    verificaVetor(aNumeros)
Return 

Static Function menu()
    local nResp := 0
    local lCont := .t.
    
    while lCont
        nResp := val(fwInputBox("Você quer popular o array? [1] - Sim [2] - Não"))
        
        if nResp == 2 .or. nResp == 1
            lCont := .f.
        endif 
    end 
return nResp

Static Function vetorUsuario(aNumeros)
    local nCont, nNum := 0

    for nCont := 1 to NMAX 
        nNum := val(fwInputBox("Digite um número: "))
        Aadd(aNumeros, nNum)        
    next
Return 

Static Function vetorRandomico(aNumeros)
    local nCont, nNum := 0

    for nCont := 1 to NMAX 
        nNum := Randomize(1, 500)
        Aadd(aNumeros, nNum)        
    next
Return 

Static Function pesquisaVetor(aNumeros)
    local lRepete := .f.
    local nCont, nPesq := 0 

    nPesq := val(fwInputBox("Pesquise por um número")) 

    for nCont := 1 to NMAX
        lRepete := cValToChar(nPesq) == cValToChar(aNumeros[nCont])
        if lRepete
            fwAlertSuccess("O número "+ cValToChar(nPesq) +" aparece no Array na posição " + cValToChar(nCont), "Que legal!")
            Return 
        endif  
    next
    fwAlertError("O número " + cValToChar(nPesq) + " não aparece no Array", "Que pena!")
Return 

Static Function ordenaVetor(aNumeros)
    aSort(aNumeros)
Return 

Static Function exibeVetor(aNumeros, cTitulo)
    local cMsg := ""
    local nCont := 0

    for nCont := 1 to NMAX
        cMsg += cValToChar(aNumeros[nCont]) + ", "
    next

    FwAlertInfo(cMsg, cTitulo)
Return 

Static Function decresceVetor(aNumeros)
    local nCont := 0
    local aAux  := {}

    aSort(aNumeros)
    aAux := aClone(aNumeros)
    aNumeros := {}

    for nCont := NMAX to 1 step - 1
        aAdd(aNumeros, aAux[nCont])
    next
Return 

Static Function somaVetor(aNumeros)
    local nSoma := 0
    local nCont := 0

    for nCont := 1 to NMAX
        nSoma += aNumeros[nCont]
    next
Return nSoma 

Static Function mediaVetor(aNumeoros, nSoma)
    local nMedia := nSoma / NMAX     
Return nMedia

Static Function maiorMenor(aNumeros)
    local nMaior, nMenor := 0

    aSort(aNumeros)
    nMaior := aNumeros[NMAX]
    nMenor := aNumeros[1]

    FwAlertInfo("Menor: " + cValToChar(nMenor) + CRLF + CRLF + "Maior: " + cValToChar(nMaior), "Números do Vetor")
Return 

Static Function verificaVetor(aNumeros)
    local cHelp   := ""
    local lRepete := .f.
    local nCont, nI, nQuantRept := 0  

    for nCont := 1 to NMAX
        for nI := (nCont + 1) to NMAX
            cHelp := cValToChar(aNumeros[nCont])
            lRepete := cHelp == cValToChar(aNumeros[nI])
            if lRepete
                nQuantRept++
            endif  
        next

        if nQuantRept > 0 
            fwAlertInfo("O número " + cValToChar(aNumeros[nCont]) + " repetiu no array " + cValToChar(nQuantRept) + " vez", "Houve Repetição")
            nQuantRept := 0
        endif 
        nI := 1
    next
Return 

Static Function embaralhaVetor(aNumeros)
    local nCont := 0
    local aHelp := {}

    aHelp := aClone(aNumeros)
    aNumeros := {}

    for nCont := 1 to 4
        aAdd(aNumeros, aHelp[nCont])    
    next

    for nCont := NMAX to 4 step - 1
        aAdd(aNumeros, aHelp[nCont])
    next
Return 
