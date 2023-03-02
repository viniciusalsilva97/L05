#INCLUDE 'totvs.ch'

#DEFINE NMAX 12

User Function L05E14()
    local aCaracteres := {}

    populaVetor(aCaracteres)
    verificaVetor(aCaracteres)
    exibeVetor(aCaracteres)
Return 

Static Function populaVetor(aCaracteres)
    local nCont, nNum := 0

    for nCont := 1 to NMAX 
        // nNum := Randomize(97, 122)
        nNum := val(fwInputBox("Digite um número entre 97 e 122 (" + cValToChar(nCont) + "/12)"))
        Aadd(aCaracteres, chr(nNum))        
    next
Return 

Static Function verificaVetor(aCaracteres)
    local cHelp   := ""
    local lRepete := .f.
    local nCont, nI := 0  

    for nCont := 1 to NMAX
        for nI := (nCont + 1) to NMAX
            cHelp := cValToChar(aCaracteres[nCont])
            lRepete := cHelp == cValToChar(aCaracteres[nI])
            if lRepete
                aCaracteres := {} 
                nI := 1
                fwAlertError("Os números repetiram", "Atenção!")
                populaVetor(aCaracteres) 
            endif  
        next
    next
Return 

Static Function exibeVetor(aCaracteres)
    local cMsg := ""
    local nCont := 0

    for nCont := 1 to NMAX
        cMsg += cValToChar(aCaracteres[nCont]) + ", "
    next

    FwAlertInfo(cMsg, "Array de Letras Minúsculas")
Return 
