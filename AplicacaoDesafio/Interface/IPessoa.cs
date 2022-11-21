using AplicacaoDesafioAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AplicacaoDesafioAPI.Interface
{
    public interface IPessoa
    {
        void Add(Pessoa Pessoa);
        void Update(Pessoa Pessoa);

        void Delete(Pessoa Pessoa);
        Task<Pessoa> SelecionarByPk(int id);
        Task<IEnumerable<Pessoa>> SelecionarTodos();
        Task<bool> SaveAllAsync();


    }
}
