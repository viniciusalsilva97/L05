#INCLUDE 'totvs.ch'

#DEFINE NMAX 20

User Function L05E04()
    local aNumeros := {}
    local cMsg     := ""
    local lPar     := .f.
    local nCont    := 0
    local nPosi    := 0

    for nCont := 2 to NMAX
        lPar := nCont % 2 == 0
        if lPar
            Aadd(aNumeros, nCont)
            nPosi++        
            cMsg += cValToChar(aNumeros[nPosi]) + ", "
        endif
    next

    FwAlertInfo(cMsg, "Vetor de números pares")
    
Return 
