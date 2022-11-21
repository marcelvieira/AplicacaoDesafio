using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace AplicacaoDesafioAPI.Models;

public partial class Pessoa
{
    public int Id { get; set; }

    public string? Nome { get; set; }

    public string? Morada { get; set; }

    public string? Email { get; set; }

    public string FotoUrl { get; set; }

    public string Grupo { get; set; }
    
    public virtual ICollection<Telefone> Telefone { get; } = new List<Telefone>(); 
}