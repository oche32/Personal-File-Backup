-- Checking whether ordered products are in stock when customers placing orders:
CREATE TRIGGER check_stock_before_order
BEFORE INSERT ON ordered_item
FOR EACH ROW
WHEN (NEW.ordered_quantity > (SELECT stock_quantity FROM product WHERE product_number = NEW.product_number))
BEGIN
    SELECT RAISE(ABORT, 'Sorry! Quantity ordered exceeds available stock, please reduce the quantity or try again later, thank you!');
END;



-- Successful example of order placement:
INSERT INTO orders (order_number, order_date, deduction, subtotal, sum_subtotal, grand_total, email) VALUES
(47, '2024-07-28', '20%', '49.95', 49.95, 39.96, 'joseph.cook@gmail.com');

INSERT INTO ordered_item (ordered_item_id, ordered_quantity, order_number, product_number) VALUES
(3101, 5, 47, 50070);


-- Unsuccessful example of order placement:
INSERT INTO orders (order_number, order_date, deduction, subtotal, sum_subtotal, grand_total, email) VALUES
(48, '2024-07-28', '20%', '49.95', 49.95, 39.96, 'joseph.cook@gmail.com');

INSERT INTO ordered_item (ordered_item_id, ordered_quantity, order_number, product_number) VALUES
(3102, 85, 48, 50070);