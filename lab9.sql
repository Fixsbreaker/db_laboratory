-- Task 1: Stored procedure to increase value by 10
CREATE OR REPLACE FUNCTION increase_value(input_value INT)
RETURNS INT AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

-- Task 2: Stored procedure to compare two numbers
CREATE OR REPLACE FUNCTION compare_numbers(a INT, b INT, OUT result TEXT)
AS $$
BEGIN
    IF a > b THEN
        result := 'Greater';
    ELSIF a = b THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Task 3: Stored procedure to generate a number series
CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TABLE(series INT) AS $$
BEGIN
    FOR series IN 1..n LOOP
        RETURN NEXT series;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Task 4: Stored procedure to find an employee by name
CREATE OR REPLACE FUNCTION find_employee(emp_name TEXT)
RETURNS TABLE(employee_id INT, name TEXT, position TEXT, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, position, salary
                 FROM employees
                 WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

-- Task 5: Stored procedure to list products from a given category
CREATE OR REPLACE FUNCTION list_products(category_name TEXT)
RETURNS TABLE(product_id INT, product_name TEXT, price NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price
                 FROM products
                 WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

-- Task 6: Two procedures where the first calls the second
CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INT)
RETURNS NUMERIC AS $$
DECLARE
    salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO salary FROM employees WHERE id = employee_id;
    bonus := salary * 0.1; -- 10% bonus
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INT)
RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees SET salary = salary + bonus WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

-- Task 7: Stored procedure with multiple parameters and nested subblocks
CREATE OR REPLACE FUNCTION complex_calculation(num1 INT, num2 INT, text_value VARCHAR)
RETURNS TEXT AS $$
DECLARE
    num_result INT;
    text_result TEXT;
    final_result TEXT;
BEGIN
    -- Subblock 1: Numeric computation
    <<numeric_block>>
    BEGIN
        num_result := num1 + num2;
    END numeric_block;

    -- Subblock 2: String manipulation
    <<string_block>>
    BEGIN
        text_result := CONCAT('Hello, ', text_value, '!');
    END string_block;

    -- Combine results
    final_result := CONCAT('Sum: ', num_result, ', Message: ', text_result);
    RETURN final_result;
END;
$$ LANGUAGE plpgsql;
