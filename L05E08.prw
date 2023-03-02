#INCLUDE 'totvs.ch'

#DEFINE NMAXA 8

User Function L05E08()
    local aA       := {}
    local cMsg     := ""
    local cAux     := ""
    local nI       := 0

    for nI := 1 to NMAXA
        Aadd(aA, nI)
        cMsg += cValToChar(aA[nI]) + " "
    next

    FwAlertInfo(cMsg, "Vetor Ordenado")
    cMsg := ""

    for nI := NMAXA to 1 step - 1
        cAux += cValToChar(aA[nI])
        aDel(aA, nI)
    next

    aA := {}

    for nI := 1 to NMAXA
        aAdd(aA, subStr(cAux, nI, 1))
        cMsg += cValToChar(aA[nI]) + " "
    next

    FwAlertInfo(cMsg, "Vetor Invertido")
    
Return 
