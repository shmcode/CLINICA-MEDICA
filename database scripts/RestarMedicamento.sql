-- Trigger para actualizar la cantidad en stock despu�s de dispensar una receta
CREATE TRIGGER tr_dispensar_medicamento ON Visita
AFTER INSERT, UPDATE
AS
BEGIN
    -- Restar la CantidadDispensada de Medicamentos.Existencias
    UPDATE m
    SET cantidadDisponible = m.cantidadDisponible - i.cantidadDispensada
    FROM Medicamento m
    INNER JOIN inserted i ON m.id = i.id;
END;




