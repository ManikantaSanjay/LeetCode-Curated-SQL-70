<h2><a href="https://leetcode.com/problems/consecutive-available-seats/">603. Consecutive Available Seats</a></h2><h3>Easy</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code>Cinema</code></p>

<pre>+-------------+------+
| Column Name | Type |
+-------------+------+
| seat_id     | int  |
| free        | bool |
+-------------+------+
seat_id is an auto-increment primary key column for this table.
Each row of this table indicates whether the i<sup>th</sup> seat is free or not. 1 means free while 0 means occupied.
</pre>

<p>&nbsp;</p>

<p>Write an SQL query to report all the consecutive available seats in the cinema.</p>

<p>Return the result table <strong>ordered</strong> by <code>seat_id</code> <strong>in ascending order</strong>.</p>

<p>The test cases are generated so that more than two seats are consecutively available.</p>

<p>The query result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre><strong>Input:</strong> 
Cinema table:
+---------+------+
| seat_id | free |
+---------+------+
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+
<strong>Output:</strong> 
+---------+
| seat_id |
+---------+
| 3       |
| 4       |
| 5       |
+---------+
</pre>
</div>