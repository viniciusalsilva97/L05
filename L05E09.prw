#INCLUDE 'totvs.ch'

#DEFINE NMAX 8

User Function L05E09()
    local aA   := {}
    local aB   := {}
    local cMsg := ""
    local nCon := 0

    for nCon := 1 to NMAX
        Aadd(aA, nCon)
        cMsg += cValToChar(aA[nCon]) + ", "
    next
    FwAlertInfo(cMsg, "Vetor Normal") 

    cMsg := ""   
    for nCon := 1 to NMAX
        Aadd(aB, aA[nCon] * 3)
        cMsg += cValToChar(aB[nCon]) + ", "
    next

    FwAlertInfo(cMsg, "Vetor com Valores Multiplicados")    
Return 
