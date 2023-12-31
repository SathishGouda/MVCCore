USE [Assesment]
GO
/****** Object:  Table [dbo].[tbl_ConvertionType]    Script Date: 09/30/2023 22:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ConvertionType](
	[ConvertionType] [varchar](100) NULL,
	[ConvertionValue] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetConvertionValueByType]    Script Date: 09/30/2023 22:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConvertionValueByType]
(
   @ConvertionType varchar(100) = NULL,
   @Value float = 0
)
AS
 DECLARE @Result float = 0.00
 DECLARE @Description VARCHAR(50)= NULL
BEGIN

  IF(@ConvertionType = 'Feet')
    BEGIN
     SET @Result = @Value*12;
     SET @Description = 'Inch'
    END
   ELSE IF(@ConvertionType = 'Inch')
     BEGIN
		SET @Result = @Value/12;
		SET @Description = 'Feet'
	 END
   ELSE IF(@ConvertionType = 'Yard')
	 BEGIN
		SET @Result = @Value*3;
		SET @Description = 'Feet'
	 END
	 ELSE IF(@ConvertionType = 'Meters')
	 BEGIN
		SET @Result = @Value*1.0936;
		SET @Description = 'Yards'
	 END
   ELSE IF(@ConvertionType = 'Yards')
	 BEGIN
		SET @Result = @Value/1.0936;
		SET @Description = 'Meters'
	 END
  
   SELECT @Result [CONVERTION_VALUE], @Description [CONVERTION_TYPE]
END
GO
