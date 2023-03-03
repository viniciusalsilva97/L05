#INCLUDE 'totvs.ch'

#DEFINE NMAX 8

User Function L05E17()
    local aNumeros := {}
    local oDlg   := nil 
    local cTitle := 'Manipulação de Array'

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 660, 317 PIXEL
        @ 014, 050 button "Array Randômico" size 60, 14 pixel of oDlg action vetorRandomico(aNumeros)
        @ 044, 050 button "Popular o Array" size 60, 14 pixel of oDlg action vetorUsuario(aNumeros)
        @ 074, 050 button "Ordenar o Array" size 60, 14 pixel of oDlg action ordenaVetor(aNumeros)
        @ 0104, 050 button "Array Decrescente" size 60, 14 pixel of oDlg action decresceVetor(aNumeros)
        @ 0134, 050 button "Pesquise um Número" size 60, 14 pixel of oDlg action pesquisaVetor(aNumeros)
        @ 0164, 050 button "Some os Números" size 60, 14 pixel of oDlg action somaVetor(aNumeros)
        @ 0194, 050 button "Veja a Média" size 60, 14 pixel of oDlg action mediaVetor(aNumeros)
        @ 0224, 050 button "Maior e Menor" size 60, 14 pixel of oDlg action maiorMenor(aNumeros)
        @ 0254, 050 button "Embaralhar Array" size 60, 14 pixel of oDlg action embaralhaVetor(aNumeros)
        @ 0284, 050 button "Repetiu?" size 60, 14 pixel of oDlg action verificaVetor(aNumeros)
        @ 0314, 050 button "Limpar Array" size 60, 14 pixel of oDlg action limpaVetor(aNumeros)
    ACTIVATE MSDIALOG oDlg CENTERED  

Return 

Static Function vetorUsuario(aNumeros)
    local nCont, nNum := 0

    if !empty(aNumeros)
        limpaVetor(aNumeros)
    endif

    for nCont := 1 to NMAX 
        nNum := val(fwInputBox("Digite um número: "))
        Aadd(aNumeros, nNum)        
    next

    exibeVetor(aNumeros, "Array Populado")
Return

Static Function limpaVetor(aNumeros)
    aNumeros := {}
Return 

Static Function vetorRandomico(aNumeros)
    local nCont, nNum := 0

    if !empty(aNumeros)
        limpaVetor(aNumeros)
    endif

    for nCont := 1 to NMAX 
        nNum := Randomize(1, 500)
        Aadd(aNumeros, nNum)        
    next

    exibeVetor(aNumeros, "Array Populado")
Return 

Static Function pesquisaVetor(aNumeros)
    local lRepete := .f.
    local nCont, nPesq := 0

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif 

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
    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    aSort(aNumeros)
    exibeVetor(aNumeros, "Array Ordenado")
Return 

Static Function exibeVetor(aNumeros, cTitulo)
    local cMsg := ""
    local nCont := 0

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    for nCont := 1 to NMAX
        cMsg += cValToChar(aNumeros[nCont]) + ", "
    next

    FwAlertInfo(cMsg, cTitulo)
Return 

Static Function decresceVetor(aNumeros)
    local nCont := 0
    local aAux  := {}

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    aSort(aNumeros)
    aAux := aClone(aNumeros)
    aNumeros := {}

    for nCont := NMAX to 1 step - 1
        aAdd(aNumeros, aAux[nCont])
    next

    exibeVetor(aNumeros, "Array Decrescente")
Return 

Static Function somaVetor(aNumeros)
    local nSoma := 0
    local nCont := 0

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    for nCont := 1 to NMAX
        nSoma += aNumeros[nCont]
    next

    fwAlertSuccess(cValToChar(nSoma), "Valores do Array Somados")
Return 

Static Function mediaVetor(aNumeros)
    local nMedia := 0
    local nSoma := 0
    local nCont := 0

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    for nCont := 1 to NMAX
        nSoma += aNumeros[nCont]
    next

    nMedia := nSoma / NMAX 
    fwAlertSuccess(cValToChar(nMedia), "Media dos Valores do Array")    
Return 

Static Function maiorMenor(aNumeros)
    local nMaior, nMenor := 0

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    aSort(aNumeros)
    nMaior := aNumeros[NMAX]
    nMenor := aNumeros[1]

    FwAlertInfo("Menor: " + cValToChar(nMenor) + CRLF + CRLF + "Maior: " + cValToChar(nMaior), "Números do Vetor")
Return 

Static Function verificaVetor(aNumeros)
    local cHelp   := ""
    local lRepete := .f.
    local lVerifi := .t.
    local nCont, nI, nQuantRept := 0 

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif 

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
            lVerifi := .f.
        endif 
        nI := 1
    next

    if lVerifi
        fwAlertInfo("Nenhum número se repetiu nesse Array!", "Não houve repetição")
    endif
Return 

Static Function embaralhaVetor(aNumeros)
    local nCont := 0
    local aHelp := {}

    if empty(aNumeros)
        fwAlertError("O vetor está vazio!", "Vetor Vazio!")
        Return 
    endif

    aHelp := aClone(aNumeros)
    aNumeros := {}

    for nCont := 1 to 4
        aAdd(aNumeros, aHelp[nCont])    
    next

    for nCont := NMAX to 4 step - 1
        aAdd(aNumeros, aHelp[nCont])
    next

    exibeVetor(aNumeros, "Array Embaralhado")
Return 
