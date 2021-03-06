-- deliverable 1
SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   titles.title,
	   titles.from_date,
	   titles.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles
ON (e.emp_no=titles.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
--drop table recent_retirement_titles
--drop table unique_titles
SELECT DISTINCT ON (rt.emp_no)
                   rt.emp_no,
                   rt.first_name,
                   rt.last_name,
                   rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no,rt.to_date DESC;

--SELECT * FROM unique_titles;
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count(ut.title) DESC;

-- deliverable 2 
-- weekly chanllenge 2
SELECT DISTINCT ON (e.emp_no)
       e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   titles.title
INTO mentorship_eligibilty
FROM employees as e
     LEFT JOIN dept_emp as de
	     ON (e.emp_no=de.emp_no)
	 LEFT JOIN titles
	     ON(e.emp_no=titles.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND  (de.to_date='9999-01-01')
ORDER BY e.emp_no;