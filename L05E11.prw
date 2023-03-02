#INCLUDE 'totvs.ch'

#DEFINE NMAX 10

User Function L05E11()
    local aA   := {}
    local aB   := {}
    local cMsg := ""
    local nI, nJ, nSomatorio := 0

    for nI := 1 to NMAX
        Aadd(aA, nI)
    next

    for nJ := 1 to NMAX 
        nSomatorio += aA[nJ]
        Aadd(aB, nSomatorio)
        cMsg += cValToChar(aB[nJ]) + ", "
    next

    FwAlertInfo(cMsg, "Cada posição tem um valor somado com a posição anterior")
    
Return 
