<h2><a href="https://leetcode.com/problems/find-median-given-frequency-of-numbers/">571. Find Median Given Frequency of Numbers</a></h2><h3>Hard</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code>Numbers</code></p>

<pre>+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
| frequency   | int  |
+-------------+------+
num is the primary key for this table.
Each row of this table shows the frequency of a number in the database.
</pre>

<p>&nbsp;</p>

<p>The <a href="https://en.wikipedia.org/wiki/Median" target="_blank"><strong>median</strong></a> is the value separating the higher half from the lower half of a data sample.</p>

<p>Write an SQL query to report the <strong>median</strong> of all the numbers in the database after decompressing the <code>Numbers</code> table. Round the median to <strong>one decimal point</strong>.</p>

<p>The query result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre><strong>Input:</strong> 
Numbers table:
+-----+-----------+
| num | frequency |
+-----+-----------+
| 0   | 7         |
| 1   | 1         |
| 2   | 3         |
| 3   | 1         |
+-----+-----------+
<strong>Output:</strong> 
+--------+
| median |
+--------+
| 0.0    |
+--------+
<strong>Explanation:</strong> 
If we decompress the Numbers table, we will get [0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3], so the median is (0 + 0) / 2 = 0.
</pre>
</div>