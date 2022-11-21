using AplicacaoDesafioAPI.Interface;
using AplicacaoDesafioAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace AplicacaoDesafioAPI.Repositories
{
    public class PessoaRepositorio : IPessoa
    {
        private readonly ChallengeContext _context;

        public PessoaRepositorio(ChallengeContext context)

        {
            _context = context;
        }

        public void Add(Pessoa Pessoa)
        {
            _context.Pessoa.Add(Pessoa);
        }

        public void Delete(Pessoa Pessoa)
        {
            _context.Pessoa.Remove(Pessoa);
        }

        public async Task<bool> SaveAllAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public Task<IEnumerable<Pessoa>> Selecionar()
        {
            throw new NotImplementedException();
        }

        public async Task<Pessoa> SelecionarByPk(int id)
        {
            return await _context.Pessoa.Where(x => x.Id == id).FirstOrDefaultAsync();
            
        }

        public async Task<IEnumerable<Pessoa>> SelecionarTodos()
        {
            return await _context.Pessoa.ToListAsync();
        }

        public void Update(Pessoa Pessoa)
        {
            _context.Entry(Pessoa).State = EntityState.Modified;

        }
    }
}
