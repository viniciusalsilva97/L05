#INCLUDE 'totvs.ch'

#DEFINE NMAX 12

User Function L05E15()
    local aVet := {}
    local cMsg := ""
    local nNum, nAux, nI, nCont := 0
    

    for nCont := 1 to NMAX
        nNum := Randomize(1, 100)
        aAdd(aVet, nNum)
        cMsg += cValToChar(aVet[nCont]) + ", "
    next
    FwAlertInfo(cMsg, "Vetor Populado")

    for nCont := 1 to NMAX
        for nI := 1 to NMAX
            if aVet[nCont] < aVet[nI]
                nAux := aVet[nCont]
                aVet[nCont] := aVet[nI]
                aVet[nI] := nAux
            endif 
        next
    next

    cMsg := ""
    for nI := 1 to NMAX
        cMsg += cValToChar(aVet[nI]) + ", "
    next

    FwAlertInfo(cMsg, "Vetor Ordenado")

Return 
