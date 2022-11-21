using AplicacaoDesafioAPI.Interface;
using AplicacaoDesafioAPI.Models;
using AplicacaoDesafioAPI.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace AplicacaoDesafioAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PessoaController : Controller
    {

        private readonly IPessoa _pessoaRepositorio;
        public PessoaController(IPessoa PessoaRepositorio)
        {
            _pessoaRepositorio = PessoaRepositorio;
        }

        [HttpGet("selecionarTodos")]
        public async Task<ActionResult<IEnumerable<Pessoa>>> GetPessoas()
        {
            return Ok(await _pessoaRepositorio.SelecionarTodos());
        }
        [HttpPost]
        public async Task<ActionResult> AddPessoa(Pessoa pessoa)
        {
            _pessoaRepositorio.Add(pessoa);
            if (await _pessoaRepositorio.SaveAllAsync()) {
                return Ok("Adicionado");
            }
            return BadRequest("Ocorreu algum erro ao tentar cadastrar");

        }
        [HttpPut]
        public async Task<ActionResult> UpdatePessoa(Pessoa pessoa)
        {
            _pessoaRepositorio.Update(pessoa);
            if (await _pessoaRepositorio.SaveAllAsync())
            {
                return Ok("Dado alterado com sucesso");
            }
            return BadRequest("Ocorreu algum erro ao tentar alterar dado");
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeletePessoa(int id)
        {
            var pessoa = await _pessoaRepositorio.SelecionarByPk(id);
            if (pessoa == null)
            {
                return NotFound("Registro não encontrado para ser deletada");
            }
            _pessoaRepositorio.Delete(pessoa);
            if (await _pessoaRepositorio.SaveAllAsync())
                return Ok("Pessoa excluida da base");
            return BadRequest("Erro ao excluir");
        }
        [HttpGet("{id}")]
        public async Task<ActionResult> FindPessoa (int id)
        {
            var pessoa = await _pessoaRepositorio.SelecionarByPk(id);
            if(pessoa == null)
            {
                return NotFound("Pessoal não encontrada");
            }
            return Ok(pessoa);
        }
    }
}
