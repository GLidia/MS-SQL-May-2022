CREATE TRIGGER tr_DeleteAllRelationsOfProductUponDeletionOfProduct
ON Products INSTEAD OF DELETE
AS
	DELETE FROM Feedbacks 
		WHERE ProductId = (SELECT Id FROM deleted)
	DELETE FROM ProductsIngredients
		WHERE ProductId = (SELECT Id FROM deleted)
	DELETE FROM Products
		WHERE Id = (SELECT id FROM deleted)
