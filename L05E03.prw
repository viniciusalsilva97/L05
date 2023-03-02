#INCLUDE 'totvs.ch'

#DEFINE NMAX 30

User Function L05E03()
    local aNumeros := {}
    local nCont    := 0
    local cMsg     := ""

    for nCont := 1 to NMAX
        Aadd(aNumeros, nCont)  
        cMsg += cValToChar(aNumeros[nCont]) + ", "      
    next

    FwAlertInfo(cMsg, "Vetor de 30 posições")
    
Return 
