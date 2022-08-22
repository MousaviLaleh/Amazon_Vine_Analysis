# Amazon Vine Analysis

Analyzing Amazon reviews written by members of the paid Amazon Vine program using PySpark, AWS, Google Colab Notebook and pgAdmin. <br/>
The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

<br/>

### Resources
- Data:&nbsp; [Amazon Review Dataset](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt),&nbsp; [Outdoors Review Dataset](https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Outdoors_v1_00.tsv.gz)
- Softwares:&nbsp; [Google Colab Notebook](https://colab.research.google.com/notebooks/welcome.ipynb),&nbsp; [pgAdmin](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads),&nbsp; [AWS](https://aws.amazon.com/)


<br/>

## Perform ETL on Amazon Product Reviews
We will transform the DataFrame into four separate DataFrames that match the table schema in pgAdmin. Then, we will upload the transformed data into the appropriate tables and run queries in pgAdmin to confirm that the data has been uploaded.

<br/>

![01.png](Images/01.png)

<br/>

Queries to confirm that the data has been uploaded

<br/>

![02.png](Images/02.png)


<br/>


## Determine Bias of Vine Reviews
For this analysis, we will determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. 
<br/>

First we pick reviews  that are more likely to be helpful.

<br/>
![03.png](Images/03.png)

<br/>

In the next step we will retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%. <br/>

![04.png](Images/04.png)

<br/>

And then check if the reviews was or was not part of the Vine program. <br/>
![05.png](Images/05.png)
<br/>
![06.png](Images/06.png)

<br/>

### Percentage of 5-star reviews

- **Vine and Non-Vine Program Reviews**

<br/>

![07.png](Images/07.png)



## Summary
The paid members with 52.34 percent and non-paid members with 52.69 percent show that having a paid Vine review doesn't makes a difference in the percentage of 5-star reviews for the outdoor equipments in Amazon market, and the companies can cancel this payment.

<br/>




