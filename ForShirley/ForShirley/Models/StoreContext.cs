using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ForShirley.Models
{
    public class StoreContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }

        public StoreContext(DbContextOptions<StoreContext> options) : base(options) 
        {
        
        }
    }
}
