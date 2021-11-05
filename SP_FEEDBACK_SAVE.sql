create or replace NONEDITIONABLE PROCEDURE "SP_FEEDBACK_SAVE" 
/*=============================================  
 Author:  quynh.vu
 Create date: 2021.10.04
 Description: send feedback 
 Trello: https://trello.com/c/nj06L09x
=============================================*/  
(
    P_FEEDBACK_TYPE_ID IN NUMBER,
    P_FEEDBACK_TYPE IN VARCHAR2,
    P_FULL_NAME IN VARCHAR2,
    P_PHONE_NUMBER IN VARCHAR2,
    P_EMAIL  IN VARCHAR2,
    P_DESCRIPTION IN VARCHAR2,
    P_RATING IN NUMBER,
    P_STATUS IN NUMBER,
    P_CREATED_BY  IN VARCHAR2,
    P_RESULT OUT INTEGER
) AS 
BEGIN
    INSERT INTO FEEDBACK (
            FEEDBACK_TYPE_ID, 
            FEEDBACK_TYPE, 
            FULL_NAME,
            PHONE_NUMBER,
            EMAIL,
            DESCRIPTION,
            RATING,
            STATUS,
            CREATED_BY,
            CREATED_DATE
        )
	VALUES(
            P_FEEDBACK_TYPE_ID,
            P_FEEDBACK_TYPE ,
            P_FULL_NAME ,
            P_PHONE_NUMBER ,
            P_EMAIL ,
            P_DESCRIPTION,
            P_RATING,
            P_STATUS,
            P_CREATED_BY,
            SYSDATE
        );

	P_RESULT:= SQL%ROWCOUNT;

END SP_FEEDBACK_SAVE;