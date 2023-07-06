<h2><a href="https://leetcode.com/problems/report-contiguous-dates/">1225. Report Contiguous Dates</a></h2><h3>Hard</h3><hr><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>Table: <code>Failed</code></p>

<pre>+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| fail_date    | date    |
+--------------+---------+
fail_date is the primary key for this table.
This table contains the days of failed tasks.
</pre>

<p>&nbsp;</p>

<p>Table: <code>Succeeded</code></p>

<pre>+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| success_date | date    |
+--------------+---------+
success_date is the primary key for this table.
This table contains the days of succeeded tasks.
</pre>

<p>&nbsp;</p>

<p>A system is running one task <strong>every day</strong>. Every task is independent of the previous tasks. The tasks can fail or succeed.</p>

<p>Write an SQL query to generate a report of <code>period_state</code> for each continuous interval of days in the period from <code>2019-01-01</code> to <code>2019-12-31</code>.</p>

<p><code>period_state</code> is <em>'</em><code>failed'</code><em> </em>if tasks in this interval failed or <code>'succeeded'</code> if tasks in this interval succeeded. Interval of days are retrieved as <code>start_date</code> and <code>end_date.</code></p>

<p>Return the result table ordered by <code>start_date</code>.</p>

<p>The query result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre><strong>Input:</strong> 
Failed table:
+-------------------+
| fail_date         |
+-------------------+
| 2018-12-28        |
| 2018-12-29        |
| 2019-01-04        |
| 2019-01-05        |
+-------------------+
Succeeded table:
+-------------------+
| success_date      |
+-------------------+
| 2018-12-30        |
| 2018-12-31        |
| 2019-01-01        |
| 2019-01-02        |
| 2019-01-03        |
| 2019-01-06        |
+-------------------+
<strong>Output:</strong> 
+--------------+--------------+--------------+
| period_state | start_date   | end_date     |
+--------------+--------------+--------------+
| succeeded    | 2019-01-01   | 2019-01-03   |
| failed       | 2019-01-04   | 2019-01-05   |
| succeeded    | 2019-01-06   | 2019-01-06   |
+--------------+--------------+--------------+
<strong>Explanation:</strong> 
The report ignored the system state in 2018 as we care about the system in the period 2019-01-01 to 2019-12-31.
From 2019-01-01 to 2019-01-03 all tasks succeeded and the system state was "succeeded".
From 2019-01-04 to 2019-01-05 all tasks failed and the system state was "failed".
From 2019-01-06 to 2019-01-06 all tasks succeeded and the system state was "succeeded".
</pre>
</div>