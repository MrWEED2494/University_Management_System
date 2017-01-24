using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace University_Management_System.DAL
{
    public class Connection
    {
        public string GetConnection()
        {
            string connectionString = @"Data Source=ShahinAhmed;Initial Catalog=UniversityManagement; Uid=sa; Password=132188";

            return connectionString;

        }
    }
}