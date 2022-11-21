using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace AplicacaoDesafioAPI.Models;

public partial class Telefone
{
    public int IdItem { get; set; }

    public int IdPessoa { get; set; }

    public string Tipo { get; set; }

    public string Numero { get; set; }

    public virtual Pessoa IdPessoaNavigation { get; set; }
}