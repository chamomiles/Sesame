# Sesame
**Tiny app that tells you the minimum votes for a poll, based on the poll's resulting percentages.**

Let's say there's a poll with results like this:

> **What's your favorite color?**
> - Blue – **26.3%**
> - Purple – **20.5%**
> - Green – **13.2%**
> - Red – **11.6%**
> - Black – **10.5%**
> - Pink – **7.9%**
> - *Other* – **10%**

Pretty often, polls don't tell us the **amount of people who voted on them**. Sometimes it is useful to know this. To know how reliable the data is, or for other reasons.

In that kind of situation, we can guess the minimum number of votes by the information available to us – the resulting percentages. This works both for whole numbers and rounded numbers *(assuming standard rounding)*.

For the poll above, the minimum number of votes is **43**. This is because a rounded result of **11.6%** only becomes achievable at 43 votes.
**5 out of 43 is 11.627907%.**
*With the denominator 42 or below, no fraction gives that result after rounding.*

We can get that result by inputting `26.3 20.5 13.2 11.6 10.5 7.9 10` into Sesame once it prompts us:

```
USE: Enter a percentage, or multiple percentages, (in the format of "20 49.5 30.5") to get the minimum number of votes in a poll that is required to produce those resulting percentages.
For instance, a poll with the results [50%, 25% and 25%] must have at least 4 votes, since to produce 25%, you need at least 1 out of 4.
Percentages: 26.3 20.5 13.2 11.6 10.5 7.9 10
43
```

*For the record, the actual number of votes on that poll was 190.*
