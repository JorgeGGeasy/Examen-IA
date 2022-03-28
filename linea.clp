(deffacts line
    (lineaPedido palet naranjas 0 palet manzanas 0 palet caquis 0 palet uva 0 almacen palet naranjas 2 palet manzanas 4 palet caquis 2 palet uva 2)
    (pedido palet naranjas 2 palet manzanas 2 palet caquis 0 palet uva 1)
    (transporte 3)
)

(defrule acabar
    (declare (salience 150))
    (lineaPedido palet naranjas ?naranjas palet manzanas ?manzanas palet caquis ?caquis palet uva ?uva almacen $?almacen)
    (pedido palet naranjas ?naranjas palet manzanas ?manzanas palet caquis ?caquis palet uva ?uva)
    =>
    (printout t "He acabado" crlf)
    (halt)

)

(defrule mover_unPoco
    (declare (salience 120))
    (lineaPedido $?preLinea palet ?fruta ?frutaLinea $?postLinea almacen $?preA palet ?fruta ?frutaA $?postA)
    (pedido $?preP palet ?fruta ?frutaP $?postP)
    (transporte ?numeroTransporte)
    (test (>=(+ ?frutaLinea ?frutaA) ?frutaP))
    (test (> ?numeroTransporte ?frutaP))
    (test (<> ?frutaLinea ?frutaP))
    =>
    (assert(lineaPedido $?preLinea palet ?fruta (+ ?frutaLinea ?frutaP) $?postLinea almacen $?preA palet ?fruta (- ?frutaA ?frutaP) $?postA))
)

(defrule mover_todo
    (declare (salience 120))
    (lineaPedido $?preLinea palet ?fruta ?frutaLinea $?postLinea almacen $?preA palet ?fruta ?frutaA $?postA)
    (pedido $?preP palet ?fruta ?frutaP $?postP)
    (transporte ?numeroTransporte)
    (test (>=(+ ?frutaLinea ?frutaA) ?frutaP))
    (test (< ?numeroTransporte ?frutaP))
    (test (<> ?frutaLinea ?frutaP))
    =>
    (assert(lineaPedido $?preLinea palet ?fruta (+ ?frutaLinea ?numeroTransporte) $?postLinea almacen $?preA palet ?fruta (- ?frutaA ?numeroTransporte) $?postA))
)

(defrule sinExistencias
    (declare (salience 100))
    (lineaPedido palet naranjas ?naranjas palet manzanas ?manzanas palet caquis ?caquis palet uva ?uva almacen $?almacen)
    (not(pedido palet naranjas ?naranjas palet manzanas ?manzanas palet caquis ?caquis palet uva ?uva))
    
    =>
    (printout t "No hay existencias" crlf)
    (halt)

)


