﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace UniHotel___BackEnd
{
    public partial class Hospedagens
    {
        public Hospedagens()
        {
            Contabilidade = new HashSet<Contabilidade>();
            Contas_Receber = new HashSet<Contas_Receber>();
        }

        [Key]
        public int Cod_Reserva { get; set; }
        public int? Cod_Cliente { get; set; }
        [Required]
        [StringLength(100)]
        public string Nome_Hospede { get; set; }
        [StringLength(64)]
        public string CPF_Hospede { get; set; }
        [StringLength(64)]
        public string Passaporte_Hospede { get; set; }
        public int? Mat_Func_Reserva { get; set; }
        public int? Num_Ap { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime Dt_Hora_Reserva { get; set; }
        [StringLength(10)]
        public string ID_Checkin { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? Dt_Entrada { get; set; }
        [StringLength(10)]
        public string Mat_Func_Checkin { get; set; }
        [StringLength(10)]
        public string ID_Checkout { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? Dt_Saida { get; set; }
        [StringLength(10)]
        public string Mat_Func_Checkout { get; set; }
        public long Num_NFS { get; set; }
        [StringLength(10)]
        public string Cod_Verif { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime Dt_Hora_Emissao { get; set; }
        public long CNPJ_Prestador { get; set; }
        [Required]
        [StringLength(50)]
        public string Razao_Social { get; set; }
        [StringLength(64)]
        public string CPF_Tomador { get; set; }
        [Required]
        [StringLength(100)]
        public string Nome_Tomador { get; set; }
        [Column(TypeName = "decimal(8, 2)")]
        public decimal Valor_Total { get; set; }
        [Column(TypeName = "decimal(8, 2)")]
        public decimal? Valor_ISS { get; set; }
        [StringLength(100)]
        public string Observacoes { get; set; }
        [Required]
        [StringLength(20)]
        public string Tipo_Pgto { get; set; }
        [Column(TypeName = "date")]
        public DateTime? Dt_Pgto { get; set; }
        public byte? Quant_Parc { get; set; }
        [Column(TypeName = "decimal(8, 2)")]
        public decimal? Valor_Parc { get; set; }
        [Column(TypeName = "decimal(8, 2)")]
        public decimal Valor_Pgto { get; set; }
        [StringLength(100)]
        public string Acompanhante1 { get; set; }
        [StringLength(64)]
        public string CPF_Acomp1 { get; set; }
        [StringLength(64)]
        public string Passap_Acomp1 { get; set; }
        [StringLength(100)]
        public string Acompanhante2 { get; set; }
        [StringLength(64)]
        public string CPF_Acomp2 { get; set; }
        [StringLength(64)]
        public string Passap_Acomp2 { get; set; }
        [StringLength(100)]
        public string Acompanhante3 { get; set; }
        [StringLength(64)]
        public string CPF_Acomp3 { get; set; }
        [StringLength(64)]
        public string Passap_Acomp3 { get; set; }
        [StringLength(100)]
        public string Acompanhante4 { get; set; }
        [StringLength(64)]
        public string CPF_Acomp4 { get; set; }
        [StringLength(64)]
        public string Passap_Acomp4 { get; set; }
        [StringLength(100)]
        public string Acompanhante5 { get; set; }
        [StringLength(64)]
        public string CPF_Acomp5 { get; set; }
        [StringLength(64)]
        public string Passap_Acomp5 { get; set; }

        [ForeignKey(nameof(CNPJ_Prestador))]
        [InverseProperty(nameof(ADM_Hotel.Hospedagens))]
        public virtual ADM_Hotel CNPJ_PrestadorNavigation { get; set; }
        [ForeignKey(nameof(Cod_Cliente))]
        [InverseProperty(nameof(Clientes.Hospedagens))]
        public virtual Clientes Cod_ClienteNavigation { get; set; }
        [ForeignKey(nameof(Mat_Func_Reserva))]
        [InverseProperty(nameof(Funcionarios.Hospedagens))]
        public virtual Funcionarios Mat_Func_ReservaNavigation { get; set; }
        [ForeignKey(nameof(Num_Ap))]
        [InverseProperty(nameof(Acomodacoes.Hospedagens))]
        public virtual Acomodacoes Num_ApNavigation { get; set; }
        [InverseProperty("Reserva_HospedagemNavigation")]
        public virtual ICollection<Contabilidade> Contabilidade { get; set; }
        [InverseProperty("ID_ReservaNavigation")]
        public virtual ICollection<Contas_Receber> Contas_Receber { get; set; }
    }
}