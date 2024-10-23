student('Ivanov', 101, 'Math', 5).
student('Petrov', 101, 'Math', 2).
student('Sidorov', 102, 'Physics', 4).
student('Ivanova', 103, 'Math', 3).
student('Petrova', 104, 'Chemistry', 2).

group_avg(Group, Avg) :-
    findall(Grade, student(_, Group, _, Grade), Grades),
    sum_list(Grades, Sum),
    length(Grades, Count),
    Count > 0,
    Avg is Sum / Count.

failed_students(Subject, Students) :-
    findall(Student, (student(Student, _, Subject, 2)), Students).

failed_in_group(Group, Count) :-
    findall(Student, (student(Student, Group, _, 2)), Students),
    length(Students, Count).
