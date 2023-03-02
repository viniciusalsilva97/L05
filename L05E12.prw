#INCLUDE 'totvs.ch'

#DEFINE NMAX 5

User Function L05E12()
    local aA   := {}
    local aB   := {}
    local cMsg := ""
    local nI, nJ, nNum := 0

    for nI := 1 to NMAX
        nNum := Randomize(-55, -1)
        Aadd(aA, nNum)
        cMsg += cValToChar(aA[nI]) + ", "
    next
    FwAlertInfo(cMsg, "Valores do Array A")
    nNum := 0
    cMsg := ""

    for nJ := 1 to NMAX 
        nNum := aA[nJ]
        Aadd(aB, Abs(nNum))
        cMsg += cValToChar(aB[nJ]) + ", "
    next
    FwAlertInfo(cMsg, "Valores do Array B")
    
Return 
