create or replace NONEDITIONABLE PROCEDURE SP_PRODUCT_GET_FEEDBACK 
/*=============================================  
Author:      quynh.vu
Create date: 12-10-2021 
Description: get top 3 feedback about product
Trello: https://trello.com/c/nj06L09x
=============================================*/
(
    P_FEEDBACK_TITLE_ID IN NUMBER,
    P_RESULT_OUT OUT sys_refcursor
) AS
BEGIN

    OPEN P_RESULT_OUT FOR
    SELECT 
          F.FEEDBACK_TITLE_ID AS PRODUCT_ID
        , F.FEEDBACK_TITLE
        , F.FULL_NAME
        , F.PHONE_NUMBER
        , F.EMAIL
        , F.DESCRIPTION
        , F.RATING
        , F.CREATED_BY
        , F.CREATED_DATE
    FROM FEEDBACK F
       LEFT JOIN PRODUCT_INFORMATION P ON F.FEEDBACK_TITLE_ID = P.PRODUCT_ID
    WHERE  P.PRODUCT_ID = P_FEEDBACK_TITLE_ID 
    ORDER BY F.RATING DESC
    FETCH NEXT 3 ROWS ONLY
    ;

END SP_PRODUCT_GET_FEEDBACK;