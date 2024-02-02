/****** Object:  Table [dbo].[Employee]    Script Date: 2/2/2024 4:11:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [State], [Country]) VALUES (1, N'Ram Sharma Dwadi', 30, N'Bagmati', N'Nepal')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [State], [Country]) VALUES (2, N'Manoj Poudel', 24, N'Gandaki', N'Nepal')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [State], [Country]) VALUES (4, N'Samir Khanal', 19, N'Gandaki', N'Nepal')
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [State], [Country]) VALUES (5, N'Dambar Nepali', 31, N'Bagmati', N'Nepal')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 2/2/2024 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Delete Employee
CREATE PROCEDURE [dbo].[DeleteEmployee]
(
    @Id INTEGER
)
AS
BEGIN
    DELETE FROM Employee WHERE EmployeeID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateEmployee]    Script Date: 2/2/2024 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Insert and Update Employee
CREATE PROCEDURE [dbo].[InsertUpdateEmployee]
(
    @Id INTEGER,
    @Name NVARCHAR(50),
    @Age INTEGER,
    @State NVARCHAR(50),
    @Country NVARCHAR(50),
    @Action VARCHAR(10)
)
AS
BEGIN
    IF @Action = 'Insert'
    BEGIN
        INSERT INTO Employee (Name, Age, [State], Country) VALUES (@Name, @Age, @State, @Country);
    END

    IF @Action = 'Update'
    BEGIN
        UPDATE Employee
        SET Name = @Name, Age = @Age, [State] = @State, Country = @Country
        WHERE EmployeeID = @Id;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmployee]    Script Date: 2/2/2024 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Select Employees
CREATE PROCEDURE [dbo].[SelectEmployee]
AS
BEGIN
    SELECT * FROM Employee;
END
GO
