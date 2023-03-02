#INCLUDE 'totvs.ch'

#DEFINE NMAXA 20
#DEFINE NMAXB 20

User Function L05E05()
    local aA   := {}
    local aB   := {}
    local aC   := {}
    local cMsg := ""
    local nI   := 0
    local nJ   := 0
    local nK   := 0

    for nI := 1 to NMAXA
        Aadd(aA, nI)
    next

    for nJ := 1 to NMAXB
        Aadd(aB, nJ)
    next

    for nK := 1 to NMAXA
        Aadd(aC, aA[nK] + aB[nK])
        cMsg += cValToChar(aC[nK]) + ", "
    next

    FwAlertInfo(cMsg, "Soma de Vetores")
    
Return 
