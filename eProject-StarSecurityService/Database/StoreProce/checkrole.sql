USE [StarSecurityDB]
GO
/****** Object:  StoredProcedure [dbo].[kiemtraquyen]    Script Date: 04/26/2014 09:13:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kiemtraquyen]
@EmployeeID nvarchar(15) --coi lai kieu dulieu
as
select RoleID from dbo.tb_Employee where EmployeeID = @EmployeeID