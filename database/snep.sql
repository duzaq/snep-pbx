-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-snep
-- Tempo de geração: 11/01/2025 às 05:49
-- Versão do servidor: 5.7.44
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `snep`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ccustos`
--

CREATE TABLE `ccustos` (
  `codigo` char(7) NOT NULL,
  `tipo` char(1) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `ccustos`
--

INSERT INTO `ccustos` (`codigo`, `tipo`, `nome`, `descricao`) VALUES
('1', 'E', 'ENTRADAS', 'Ligacoes de Entrada'),
('2', 'S', 'SAIDAS', 'Ligacoes de Saida'),
('5', 'O', 'FUNCIONALIDADES', 'Funcionalidades do Sistema'),
('5.01', 'O', 'Conferencias', 'Ligacoes para Salas de de Conferencias'),
('5.02', 'O', 'Logon de Agentes', 'Logon de Agentes na Fila (*01)'),
('5.03', 'O', 'Logoff de Agentes', 'Logoff de Agentes na Fila (*02)'),
('5.04', 'O', 'Pausa de Agentes - Inicio', 'Pausa de Agente na Fila (*03)'),
('5.05', 'O', 'Pausa de Agente - Fim', 'Pausa de Agente na Fila - Fim (*04)'),
('5.10', 'O', 'Emergencias', 'Ligacoes para telefones de Emergencia (190, 192, 191, etc)'),
('9', 'O', 'Internas', 'Ligacoes Internas entre Ramais');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cdr`
--

CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '0',
  `billsec` int(11) NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int(20) NOT NULL DEFAULT '0',
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `userfield` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_group`
--

CREATE TABLE `contacts_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `contacts_group`
--

INSERT INTO `contacts_group` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_names`
--

CREATE TABLE `contacts_names` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `id_state` char(2) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `group` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_phone`
--

CREATE TABLE `contacts_phone` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_binds`
--

CREATE TABLE `core_binds` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `peer_name` varchar(80) NOT NULL,
  `type` enum('bound','nobound') NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_binds_exceptions`
--

CREATE TABLE `core_binds_exceptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exception` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_city`
--

CREATE TABLE `core_city` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_cnl_city`
--

CREATE TABLE `core_cnl_city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_cnl_country`
--

CREATE TABLE `core_cnl_country` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code_2` varchar(2) NOT NULL,
  `code_3` varchar(3) NOT NULL,
  `language` varchar(5) NOT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `core_cnl_country`
--

INSERT INTO `core_cnl_country` (`id`, `name`, `code_2`, `code_3`, `language`, `locale`) VALUES
(1, 'AFEGANISTÃO', '', '', '', ''),
(2, 'ACROTÍRI E DECELIA', '', '', '', ''),
(3, 'ÁFRICA DO SUL', '', '', '', ''),
(4, 'ALBÂNIA', '', '', '', ''),
(5, 'ALEMANHA', '', '', '', ''),
(6, 'AMERICAN SAMOA', '', '', '', ''),
(7, 'ANDORRA', '', '', '', ''),
(8, 'ANGOLA', '', '', '', ''),
(9, 'ANGUILLA', '', '', '', ''),
(10, 'ANTÍGUA E BARBUDA', '', '', '', ''),
(11, 'ANTILHAS NEERLANDESAS', '', '', '', ''),
(12, 'ARÁBIA SAUDITA', '', '', '', ''),
(13, 'ARGÉLIA', '', '', '', ''),
(14, 'ARGENTINA', '', '', '', ''),
(15, 'ARMÉNIA', '', '', '', ''),
(16, 'ARUBA', '', '', '', ''),
(17, 'AUSTRÁLIA', '', '', '', ''),
(18, 'ÁUSTRIA', '', '', '', ''),
(19, 'AZERBAIJÃO', '', '', '', ''),
(20, 'BAHAMAS', '', '', '', ''),
(21, 'BANGLADECHE', '', '', '', ''),
(22, 'BARBADOS', '', '', '', ''),
(23, 'BARÉM', '', '', '', ''),
(24, 'BASSAS DA ÍNDIA', '', '', '', ''),
(25, 'BÉLGICA', '', '', '', ''),
(26, 'BELIZE', '', '', '', ''),
(27, 'BENIM', '', '', '', ''),
(28, 'BERMUDAS', '', '', '', ''),
(29, 'BIELORRÚSSIA', '', '', '', ''),
(30, 'BOLÍVIA', '', '', '', ''),
(31, 'BÓSNIA E HERZEGOVINA', '', '', '', ''),
(32, 'BOTSUANA', '', '', '', ''),
(33, 'BRASIL', '', '', '', ''),
(34, 'BRUNEI DARUSSALAM', '', '', '', ''),
(35, 'BULGÁRIA', '', '', '', ''),
(36, 'BURQUINA FASO', '', '', '', ''),
(37, 'BURUNDI', '', '', '', ''),
(38, 'BUTÃO', '', '', '', ''),
(39, 'CABO VERDE', '', '', '', ''),
(40, 'CAMARÕES', '', '', '', ''),
(41, 'CAMBOJA', '', '', '', ''),
(42, 'CANADÁ', '', '', '', ''),
(43, 'CATAR', '', '', '', ''),
(44, 'CAZAQUISTÃO', '', '', '', ''),
(45, 'CENTRO-AFRICANA REPÚBLICA', '', '', '', ''),
(46, 'CHADE', '', '', '', ''),
(47, 'CHILE', '', '', '', ''),
(48, 'CHINA', '', '', '', ''),
(49, 'CHIPRE', '', '', '', ''),
(50, 'COLÔMBIA', '', '', '', ''),
(51, 'COMORES', '', '', '', ''),
(52, 'CONGO', '', '', '', ''),
(53, 'CONGO REPÚBLICA DEMOCRÁTICA', '', '', '', ''),
(54, 'COREIA DO NORTE', '', '', '', ''),
(55, 'COREIA DO SUL', '', '', '', ''),
(56, 'COSTA DO MARFIM', '', '', '', ''),
(57, 'COSTA RICA', '', '', '', ''),
(58, 'CROÁCIA', '', '', '', ''),
(59, 'CUBA', '', '', '', ''),
(60, 'DINAMARCA', '', '', '', ''),
(61, 'DOMÍNICA', '', '', '', ''),
(62, 'EGIPTO', '', '', '', ''),
(63, 'EMIRADOS ÁRABES UNIDOS', '', '', '', ''),
(64, 'EQUADOR', '', '', '', ''),
(65, 'ERITREIA', '', '', '', ''),
(66, 'ESLOVÁQUIA', '', '', '', ''),
(67, 'ESLOVÉNIA', '', '', '', ''),
(68, 'ESPANHA', '', '', '', ''),
(69, 'ESTADOS UNIDOS', '', '', '', ''),
(70, 'ESTÓNIA', '', '', '', ''),
(71, 'ETIÓPIA', '', '', '', ''),
(72, 'FAIXA DE GAZA', '', '', '', ''),
(73, 'FIJI', '', '', '', ''),
(74, 'FILIPINAS', '', '', '', ''),
(75, 'FINLÂNDIA', '', '', '', ''),
(76, 'FRANÇA', '', '', '', ''),
(77, 'GABÃO', '', '', '', ''),
(78, 'GÂMBIA', '', '', '', ''),
(79, 'GANA', '', '', '', ''),
(80, 'GEÓRGIA', '', '', '', ''),
(81, 'GIBRALTAR', '', '', '', ''),
(82, 'GRANADA', '', '', '', ''),
(83, 'GRÉCIA', '', '', '', ''),
(84, 'GRONELÂNDIA', '', '', '', ''),
(85, 'GUADALUPE', '', '', '', ''),
(86, 'GUAM', '', '', '', ''),
(87, 'GUATEMALA', '', '', '', ''),
(88, 'GUERNSEY', '', '', '', ''),
(89, 'GUIANA', '', '', '', ''),
(90, 'GUIANA FRANCESA', '', '', '', ''),
(91, 'GUINÉ', '', '', '', ''),
(92, 'GUINÉ EQUATORIAL', '', '', '', ''),
(93, 'GUINÉ-BISSAU', '', '', '', ''),
(94, 'HAITI', '', '', '', ''),
(95, 'HONDURAS', '', '', '', ''),
(96, 'HONG KONG', '', '', '', ''),
(97, 'HUNGRIA', '', '', '', ''),
(98, 'IÉMEN', '', '', '', ''),
(99, 'ILHA BOUVET', '', '', '', ''),
(100, 'ILHA CHRISTMAS', '', '', '', ''),
(101, 'ILHA DE CLIPPERTON', '', '', '', ''),
(102, 'ILHA DE JOÃO DA NOVA', '', '', '', ''),
(103, 'ILHA DE MAN', '', '', '', ''),
(104, 'ILHA DE NAVASSA', '', '', '', ''),
(105, 'ILHA EUROPA', '', '', '', ''),
(106, 'ILHA NORFOLK', '', '', '', ''),
(107, 'ILHA TROMELIN', '', '', '', ''),
(108, 'ILHAS ASHMORE E CARTIER', '', '', '', ''),
(109, 'ILHAS CAIMAN', '', '', '', ''),
(110, 'ILHAS COCOS (KEELING)', '', '', '', ''),
(111, 'ILHAS COOK', '', '', '', ''),
(112, 'ILHAS DO MAR DE CORAL', '', '', '', ''),
(113, 'ILHAS FALKLANDS (ILHAS MALVINA', '', '', '', ''),
(114, 'ILHAS FEROE', '', '', '', ''),
(115, 'ILHAS GEÓRGIA DO SUL E SANDWIC', '', '', '', ''),
(116, 'ILHAS MARIANAS DO NORTE', '', '', '', ''),
(117, 'ILHAS MARSHALL', '', '', '', ''),
(118, 'ILHAS PARACEL', '', '', '', ''),
(119, 'ILHAS PITCAIRN', '', '', '', ''),
(120, 'ILHAS SALOMÃO', '', '', '', ''),
(121, 'ILHAS SPRATLY', '', '', '', ''),
(122, 'ILHAS VIRGENS AMERICANAS', '', '', '', ''),
(123, 'ILHAS VIRGENS BRITÂNICAS', '', '', '', ''),
(124, 'ÍNDIA', '', '', '', ''),
(125, 'INDONÉSIA', '', '', '', ''),
(126, 'IRÃO', '', '', '', ''),
(127, 'IRAQUE', '', '', '', ''),
(128, 'IRLANDA', '', '', '', ''),
(129, 'ISLÂNDIA', '', '', '', ''),
(130, 'ISRAEL', '', '', '', ''),
(131, 'ITÁLIA', '', '', '', ''),
(132, 'JAMAICA', '', '', '', ''),
(133, 'JAN MAYEN', '', '', '', ''),
(134, 'JAPÃO', '', '', '', ''),
(135, 'JERSEY', '', '', '', ''),
(136, 'JIBUTI', '', '', '', ''),
(137, 'JORDÂNIA', '', '', '', ''),
(138, 'KIRIBATI', '', '', '', ''),
(139, 'KOWEIT', '', '', '', ''),
(140, 'LAOS', '', '', '', ''),
(141, 'LESOTO', '', '', '', ''),
(142, 'LETÓNIA', '', '', '', ''),
(143, 'LÍBANO', '', '', '', ''),
(144, 'LIBÉRIA', '', '', '', ''),
(145, 'LÍBIA', '', '', '', ''),
(146, 'LISTENSTAINE', '', '', '', ''),
(147, 'LITUÂNIA', '', '', '', ''),
(148, 'LUXEMBURGO', '', '', '', ''),
(149, 'MACAU', '', '', '', ''),
(150, 'MACEDÓNIA', '', '', '', ''),
(151, 'MADAGÁSCAR', '', '', '', ''),
(152, 'MALÁSIA', '', '', '', ''),
(153, 'MALAVI', '', '', '', ''),
(154, 'MALDIVAS', '', '', '', ''),
(155, 'MALI', '', '', '', ''),
(156, 'MALTA', '', '', '', ''),
(157, 'MARROCOS', '', '', '', ''),
(158, 'MARTINICA', '', '', '', ''),
(159, 'MAURÍCIA', '', '', '', ''),
(160, 'MAURITÂNIA', '', '', '', ''),
(161, 'MAYOTTE', '', '', '', ''),
(162, 'MÉXICO', '', '', '', ''),
(163, 'MIANMAR', '', '', '', ''),
(164, 'MICRONÉSIA', '', '', '', ''),
(165, 'MOÇAMBIQUE', '', '', '', ''),
(166, 'MOLDÁVIA', '', '', '', ''),
(167, 'MÓNACO', '', '', '', ''),
(168, 'MONGÓLIA', '', '', '', ''),
(169, 'MONTENEGRO', '', '', '', ''),
(170, 'MONTSERRAT', '', '', '', ''),
(171, 'NAMÍBIA', '', '', '', ''),
(172, 'NAURU', '', '', '', ''),
(173, 'NEPAL', '', '', '', ''),
(174, 'NICARÁGUA', '', '', '', ''),
(175, 'NÍGER', '', '', '', ''),
(176, 'NIGÉRIA', '', '', '', ''),
(177, 'NIUE', '', '', '', ''),
(178, 'NORUEGA', '', '', '', ''),
(179, 'NOVA CALEDÓNIA', '', '', '', ''),
(180, 'NOVA ZELÂNDIA', '', '', '', ''),
(181, 'OMÃ', '', '', '', ''),
(182, 'PAÍSES BAIXOS', '', '', '', ''),
(183, 'PALAU', '', '', '', ''),
(184, 'PALESTINA', '', '', '', ''),
(185, 'PANAMÁ', '', '', '', ''),
(186, 'PAPUÁSIA-NOVA GUINÉ', '', '', '', ''),
(187, 'PAQUISTÃO', '', '', '', ''),
(188, 'PARAGUAI', '', '', '', ''),
(189, 'PERU', '', '', '', ''),
(190, 'POLINÉSIA FRANCESA', '', '', '', ''),
(191, 'POLÓNIA', '', '', '', ''),
(192, 'PORTO RICO', '', '', '', ''),
(193, 'PORTUGAL', '', '', '', ''),
(194, 'QUÉNIA', '', '', '', ''),
(195, 'QUIRGUIZISTÃO', '', '', '', ''),
(196, 'REINO UNIDO', '', '', '', ''),
(197, 'REPÚBLICA CHECA', '', '', '', ''),
(198, 'REPÚBLICA DOMINICANA', '', '', '', ''),
(199, 'ROMÉNIA', '', '', '', ''),
(200, 'RUANDA', '', '', '', ''),
(201, 'RÚSSIA', '', '', '', ''),
(202, 'SAHARA OCCIDENTAL', '', '', '', ''),
(203, 'SALVADOR', '', '', '', ''),
(204, 'SAMOA', '', '', '', ''),
(205, 'SANTA HELENA', '', '', '', ''),
(206, 'SANTA LÚCIA', '', '', '', ''),
(207, 'SANTA SÉ', '', '', '', ''),
(208, 'SÃO CRISTÓVÃO E NEVES', '', '', '', ''),
(209, 'SÃO MARINO', '', '', '', ''),
(210, 'SÃO PEDRO E MIQUELÃO', '', '', '', ''),
(211, 'SÃO TOMÉ E PRÍNCIPE', '', '', '', ''),
(212, 'SÃO VICENTE E GRANADINAS', '', '', '', ''),
(213, 'SEICHELES', '', '', '', ''),
(214, 'SENEGAL', '', '', '', ''),
(215, 'SERRA LEOA', '', '', '', ''),
(216, 'SÉRVIA', '', '', '', ''),
(217, 'SINGAPURA', '', '', '', ''),
(218, 'SÍRIA', '', '', '', ''),
(219, 'SOMÁLIA', '', '', '', ''),
(220, 'SRI LANCA', '', '', '', ''),
(221, 'SUAZILÂNDIA', '', '', '', ''),
(222, 'SUDÃO', '', '', '', ''),
(223, 'SUÉCIA', '', '', '', ''),
(224, 'SUÍÇA', '', '', '', ''),
(225, 'SURINAME', '', '', '', ''),
(226, 'SVALBARD', '', '', '', ''),
(227, 'TAILÂNDIA', '', '', '', ''),
(228, 'TAIWAN', '', '', '', ''),
(229, 'TAJIQUISTÃO', '', '', '', ''),
(230, 'TANZÂNIA', '', '', '', ''),
(231, 'TERRITÓRIO BRITÂNICO DO OCEANO', '', '', '', ''),
(232, 'TERRITÓRIO DAS ILHAS HEARD E M', '', '', '', ''),
(233, 'TIMOR-LESTE', '', '', '', ''),
(234, 'TOGO', '', '', '', ''),
(235, 'TOKELAU', '', '', '', ''),
(236, 'TONGA', '', '', '', ''),
(237, 'TRINDADE E TOBAGO', '', '', '', ''),
(238, 'TUNÍSIA', '', '', '', ''),
(239, 'TURKS E CAICOS', '', '', '', ''),
(240, 'TURQUEMENISTÃO', '', '', '', ''),
(241, 'TURQUIA', '', '', '', ''),
(242, 'TUVALU', '', '', '', ''),
(243, 'UCRÂNIA', '', '', '', ''),
(244, 'UGANDA', '', '', '', ''),
(245, 'URUGUAI', '', '', '', ''),
(246, 'USBEQUISTÃO', '', '', '', ''),
(247, 'VANUATU', '', '', '', ''),
(248, 'VENEZUELA', '', '', '', ''),
(249, 'VIETNAME', '', '', '', ''),
(250, 'WALLIS E FUTUNA', '', '', '', ''),
(251, 'ZÂMBIA', '', '', '', ''),
(252, 'ZIMBABUÉ', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_cnl_prefix`
--

CREATE TABLE `core_cnl_prefix` (
  `id` char(10) NOT NULL,
  `city` int(11) DEFAULT NULL,
  `country` int(11) NOT NULL,
  `latitud` varchar(8) DEFAULT NULL,
  `longitud` varchar(8) DEFAULT NULL,
  `hemisphere` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_cnl_state`
--

CREATE TABLE `core_cnl_state` (
  `id` char(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `core_cnl_state`
--

INSERT INTO `core_cnl_state` (`id`, `name`, `country`) VALUES
('AC', 'Acre', 76),
('AL', 'Alagoas', 76),
('AM', 'Amazonas', 76),
('AP', 'Amapa', 76),
('BA', 'Bahia', 76),
('CE', 'Ceara', 76),
('DF', 'Distrito Federal', 76),
('ES', 'Espirito Santo', 76),
('GO', 'Goias', 76),
('MA', 'Maranhao', 76),
('MG', 'Minas Gerais', 76),
('MS', 'Mato Grosso do Sul', 76),
('MT', 'Mato Grosso', 76),
('PA', 'Para', 76),
('PB', 'Paraiba', 76),
('PE', 'Pernambuco', 76),
('PI', 'Piaui', 76),
('PR', 'Parana', 76),
('RJ', 'Rio de Janeiro', 76),
('RN', 'Rio Grande do Norte', 76),
('RO', 'Rondonia', 76),
('RR', 'Roraima', 76),
('RS', 'Rio Grande do Sul', 76),
('SC', 'Santa Catarina', 76),
('SE', 'Sergipe', 76),
('SP', 'Sao Paulo', 76),
('TO', 'Tocantins', 76);

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_config`
--

CREATE TABLE `core_config` (
  `id` int(11) NOT NULL,
  `config_module` varchar(255) NOT NULL,
  `config_name` varchar(255) NOT NULL,
  `config_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_country`
--

CREATE TABLE `core_country` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(128) NOT NULL,
  `acronym` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_groups`
--

CREATE TABLE `core_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `core_groups`
--

INSERT INTO `core_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_notifications`
--

CREATE TABLE `core_notifications` (
  `id` int(11) NOT NULL,
  `id_itc` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `from` varchar(128) DEFAULT 'Opens',
  `message` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `reading_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_peer_groups`
--

CREATE TABLE `core_peer_groups` (
  `id` int(11) NOT NULL,
  `peer_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_state`
--

CREATE TABLE `core_state` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `country_id` int(11) NOT NULL,
  `acronym` varchar(4) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `date_alias`
--

CREATE TABLE `date_alias` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `date_alias_list`
--

CREATE TABLE `date_alias_list` (
  `dateid` int(11) NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  `timerange` varchar(11) DEFAULT '00:00-23:59',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `expr_alias`
--

CREATE TABLE `expr_alias` (
  `aliasid` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `expr_alias`
--

INSERT INTO `expr_alias` (`aliasid`, `name`) VALUES
(1, 'Fixo Local'),
(2, 'Celular Local'),
(3, 'Fixo LDN'),
(4, 'Celular LDN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `expr_alias_expression`
--

CREATE TABLE `expr_alias_expression` (
  `aliasid` int(11) NOT NULL,
  `expression` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `expr_alias_expression`
--

INSERT INTO `expr_alias_expression` (`aliasid`, `expression`) VALUES
(1, '[2-5]XXXXXXX'),
(2, '[6-9]XXXXXXX'),
(2, '9[6-9]XXXXXXX'),
(3, '0|XX[2-5]XXXXXXX'),
(3, 'XX[2-5]XXXXXXX'),
(3, '0XX|XX[2-5]XXXXXXX'),
(4, '0|XX[6-9]XXXXXXX'),
(4, '0XX|XX[6-9]XXXXXXX'),
(4, '0|XX9[4-9]XXXXXXX'),
(4, 'XX9[4-9]XXXXXXX'),
(4, '0XX|XX9[4-9]XXXXXXX');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupos`
--

CREATE TABLE `grupos` (
  `cod_grupo` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `grupos`
--

INSERT INTO `grupos` (`cod_grupo`, `nome`) VALUES
(1, 'GERAL');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itc_consumers`
--

CREATE TABLE `itc_consumers` (
  `id_distro` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `name_service` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itc_register`
--

CREATE TABLE `itc_register` (
  `uuid` varchar(36) NOT NULL,
  `client_key` varchar(60) NOT NULL,
  `api_key` varchar(72) NOT NULL,
  `created` datetime NOT NULL,
  `registered_itc` tinyint(1) DEFAULT '0',
  `noregister` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_recovery`
--

CREATE TABLE `password_recovery` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `peers`
--

CREATE TABLE `peers` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `password` varchar(12) NOT NULL,
  `accountcode` varchar(20) DEFAULT NULL,
  `amaflags` varchar(13) DEFAULT NULL,
  `callgroup` varchar(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `canreinvite` char(3) DEFAULT 'no',
  `context` varchar(80) DEFAULT NULL,
  `defaultip` varchar(15) DEFAULT NULL,
  `dtmfmode` varchar(7) DEFAULT NULL,
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `fullcontact` varchar(80) DEFAULT NULL,
  `host` varchar(31) NOT NULL DEFAULT '',
  `insecure` varchar(4) DEFAULT NULL,
  `language` char(2) DEFAULT 'br',
  `mailbox` varchar(50) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT '',
  `nat` varchar(100) NOT NULL DEFAULT 'no',
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `mask` varchar(95) DEFAULT NULL,
  `pickupgroup` int(11) DEFAULT NULL,
  `port` varchar(5) NOT NULL DEFAULT '',
  `qualify` char(5) DEFAULT NULL,
  `restrictcid` char(1) DEFAULT NULL,
  `rtptimeout` char(3) DEFAULT NULL,
  `rtpholdtimeout` char(3) DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `type` varchar(6) NOT NULL DEFAULT 'friend',
  `defaultuser` varchar(80) NOT NULL DEFAULT '',
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) DEFAULT 'ulaw;alaw;gsm',
  `musiconhold` varchar(100) DEFAULT NULL,
  `regseconds` int(11) NOT NULL DEFAULT '0',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `regexten` varchar(80) NOT NULL DEFAULT '',
  `cancallforward` varchar(3) DEFAULT 'yes',
  `setvar` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `canal` varchar(255) DEFAULT NULL,
  `call-limit` varchar(4) DEFAULT '1',
  `incominglimit` varchar(4) DEFAULT NULL,
  `outgoinglimit` varchar(4) DEFAULT NULL,
  `usa_vc` varchar(4) NOT NULL DEFAULT 'no',
  `peer_type` char(1) NOT NULL DEFAULT 'R',
  `credits` int(11) DEFAULT NULL,
  `authenticate` tinyint(1) NOT NULL DEFAULT '0',
  `subscribecontext` varchar(40) DEFAULT NULL,
  `trunk` varchar(3) NOT NULL,
  `time_total` int(11) DEFAULT NULL,
  `time_chargeby` char(1) DEFAULT NULL,
  `regserver` varchar(20) DEFAULT NULL,
  `dnd` tinyint(1) NOT NULL DEFAULT '0',
  `sigame` varchar(20) DEFAULT NULL,
  `directmedia` varchar(10) DEFAULT NULL,
  `lastms` int(11) NOT NULL,
  `callbackextension` varchar(250) DEFAULT NULL,
  `useragent` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `created`, `updated`) VALUES
(1, 'default', '2025-01-11 05:40:34', '2025-01-11 05:40:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profiles_permissions`
--

CREATE TABLE `profiles_permissions` (
  `id` int(11) NOT NULL,
  `permission_id` varchar(256) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `queues`
--

CREATE TABLE `queues` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `musiconhold` varchar(128) DEFAULT NULL,
  `announce` varchar(128) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `monitor_type` tinyint(1) DEFAULT NULL,
  `monitor_format` varchar(128) DEFAULT NULL,
  `queue_youarenext` varchar(128) DEFAULT NULL,
  `queue_thereare` varchar(128) DEFAULT NULL,
  `queue_callswaiting` varchar(128) DEFAULT NULL,
  `queue_holdtime` varchar(128) DEFAULT NULL,
  `queue_minutes` varchar(128) DEFAULT NULL,
  `queue_seconds` varchar(128) DEFAULT NULL,
  `queue_lessthan` varchar(128) DEFAULT NULL,
  `queue_thankyou` varchar(128) DEFAULT NULL,
  `queue_reporthold` varchar(128) DEFAULT NULL,
  `announce_frequency` int(11) DEFAULT NULL,
  `announce_round_seconds` int(11) DEFAULT NULL,
  `announce_holdtime` varchar(128) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `wrapuptime` int(11) DEFAULT NULL,
  `maxlen` int(11) DEFAULT NULL,
  `ringinuse` tinyint(1) NOT NULL DEFAULT '1',
  `servicelevel` int(11) DEFAULT NULL,
  `strategy` varchar(128) DEFAULT NULL,
  `joinempty` varchar(128) DEFAULT NULL,
  `leavewhenempty` varchar(128) DEFAULT NULL,
  `eventmemberstatus` tinyint(1) DEFAULT NULL,
  `eventwhencalled` tinyint(1) DEFAULT NULL,
  `reportholdtime` tinyint(1) DEFAULT NULL,
  `memberdelay` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `timeoutrestart` tinyint(1) DEFAULT NULL,
  `periodic_announce` varchar(50) DEFAULT NULL,
  `periodic_announce_frequency` int(11) DEFAULT NULL,
  `max_call_queue` int(11) DEFAULT '0',
  `max_time_call` int(11) DEFAULT '0',
  `alert_mail` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `queues_agent`
--

CREATE TABLE `queues_agent` (
  `agent_id` int(11) NOT NULL,
  `queue` varchar(80) NOT NULL,
  `penalty` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `queue_log`
--

CREATE TABLE `queue_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` char(26) DEFAULT NULL,
  `callid` varchar(32) NOT NULL DEFAULT '',
  `queuename` varchar(32) NOT NULL DEFAULT '',
  `agent` varchar(32) NOT NULL DEFAULT '',
  `event` varchar(32) NOT NULL DEFAULT '',
  `data1` varchar(100) NOT NULL DEFAULT '',
  `data2` varchar(100) NOT NULL DEFAULT '',
  `data3` varchar(100) NOT NULL DEFAULT '',
  `data4` varchar(100) NOT NULL DEFAULT '',
  `data5` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `queue_members`
--

CREATE TABLE `queue_members` (
  `uniqueid` int(10) UNSIGNED NOT NULL,
  `membername` varchar(40) DEFAULT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `penalty` int(11) DEFAULT NULL,
  `paused` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `queue_peers`
--

CREATE TABLE `queue_peers` (
  `fila` varchar(80) NOT NULL DEFAULT '',
  `ramal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `registry`
--

CREATE TABLE `registry` (
  `context` varchar(50) NOT NULL,
  `key` varchar(30) NOT NULL,
  `value` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `regras_negocio`
--

CREATE TABLE `regras_negocio` (
  `id` int(11) NOT NULL,
  `prio` int(11) NOT NULL DEFAULT '0',
  `desc` varchar(255) DEFAULT NULL,
  `origem` text NOT NULL,
  `destino` text NOT NULL,
  `validade` text NOT NULL,
  `diasDaSemana` varchar(30) NOT NULL DEFAULT 'sun,mon,tue,wed,thu,fri,sat',
  `record` tinyint(1) NOT NULL DEFAULT '0',
  `ativa` tinyint(1) NOT NULL DEFAULT '1',
  `mailing` tinyint(1) NOT NULL DEFAULT '0',
  `from_dialer` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('incoming','outgoing','others') NOT NULL DEFAULT 'others',
  `dates_alias` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `regras_negocio`
--

INSERT INTO `regras_negocio` (`id`, `prio`, `desc`, `origem`, `destino`, `validade`, `diasDaSemana`, `record`, `ativa`, `mailing`, `from_dialer`, `type`, `dates_alias`) VALUES
(0, 0, 'Internas - Ramal para Ramal', 'G:all', 'G:all', '00:00:00-23:59:59', 'sun,mon,tue,wed,thu,fri,sat', 0, 1, 0, 0, 'others', '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `regras_negocio_actions`
--

CREATE TABLE `regras_negocio_actions` (
  `regra_id` int(11) NOT NULL,
  `prio` int(11) NOT NULL,
  `action` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `regras_negocio_actions_config`
--

CREATE TABLE `regras_negocio_actions_config` (
  `regra_id` int(11) NOT NULL,
  `prio` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `services_log`
--

CREATE TABLE `services_log` (
  `date` datetime NOT NULL,
  `peer` varchar(80) NOT NULL,
  `service` varchar(50) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sounds`
--

CREATE TABLE `sounds` (
  `arquivo` varchar(50) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `data` datetime DEFAULT NULL,
  `tipo` char(3) NOT NULL DEFAULT 'AST',
  `secao` varchar(30) NOT NULL,
  `language` varchar(5) NOT NULL DEFAULT 'pt_BR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `sounds`
--

INSERT INTO `sounds` (`arquivo`, `descricao`, `data`, `tipo`, `secao`, `language`) VALUES
('a-m.wav', 'a-m', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('access-password.wav', 'access-password', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Acre.wav', 'Acre', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('activated.wav', 'activated', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('afternoon.wav', 'afternoon', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-alreadyon.wav', 'agent-alreadyon', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-incorrect.wav', 'agent-incorrect', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-loggedoff.wav', 'agent-loggedoff', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-loginok.wav', 'agent-loginok', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-newlocation.wav', 'agent-newlocation', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-pass.wav', 'agent-pass', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('agent-user.wav', 'agent-user', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Alagoas.wav', 'Alagoas', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('all-circuits-busy-now.wav', 'all-circuits-busy-now', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Amapa.wav', 'Amapa', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Amazonas.wav', 'Amazonas', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('an-error-has-occured.wav', 'an-error-has-occured', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('and.wav', 'and', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Aracaju.wav', 'Aracaju', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-accountnum.wav', 'astcc-accountnum', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-and.wav', 'astcc-and', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-badaccount.wav', 'astcc-badaccount', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-badphone.wav', 'astcc-badphone', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-cents.wav', 'astcc-cents', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-connectcharge.wav', 'astcc-connectcharge', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-dollar.wav', 'astcc-dollar', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-dollars.wav', 'astcc-dollars', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-down.wav', 'astcc-down', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-forfirst.wav', 'astcc-forfirst', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-isbusy.wav', 'astcc-isbusy', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-minute.wav', 'astcc-minute', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-minutes.wav', 'astcc-minutes', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-noanswer.wav', 'astcc-noanswer', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-notenough.wav', 'astcc-notenough', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-nothing.wav', 'astcc-nothing', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-perminute.wav', 'astcc-perminute', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-phonenum.wav', 'astcc-phonenum', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-pleasewait.wav', 'astcc-pleasewait', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-point.wav', 'astcc-point', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-remaining.wav', 'astcc-remaining', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('astcc-seconds.wav', 'astcc-seconds', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-secounds.wav', 'astcc-secounds', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('astcc-silence.wav', 'astcc-silence', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-tone.wav', 'astcc-tone', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-unavail.wav', 'astcc-unavail', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-welcome.wav', 'astcc-welcome', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-willapply.wav', 'astcc-willapply', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-willcost.wav', 'astcc-willcost', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('astcc-youhave.wav', 'astcc-youhave', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('at-tone-time-exactly.wav', 'at-tone-time-exactly', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('auth-thankyou.wav', 'auth-thankyou', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Bahia.wav', 'Bahia', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('beep.wav', 'beep', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Belem.wav', 'Belem', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Belo-Horizonte.wav', 'Belo-Horizonte', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Boa-Vista.wav', 'Boa-Vista', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Brasilia.wav', 'Brasilia', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('call-fwd-no-ans.wav', 'call-fwd-no-ans', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('call-fwd-on-busy.wav', 'call-fwd-on-busy', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('call-fwd-unconditional.wav', 'call-fwd-unconditional', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Campo-Grande.wav', 'Campo-Grande', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Ceara.wav', 'Ceara', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-enteringno.wav', 'conf-enteringno', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-errormenu.wav', 'conf-errormenu', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-getchannel.wav', 'conf-getchannel', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-getconfno.wav', 'conf-getconfno', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-getpin.wav', 'conf-getpin', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-hasjoin.wav', 'conf-hasjoin', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-hasleft.wav', 'conf-hasleft', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-invalid.wav', 'conf-invalid', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-invalidpin.wav', 'conf-invalidpin', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-kicked.wav', 'conf-kicked', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-leaderhasleft.wav', 'conf-leaderhasleft', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-locked.wav', 'conf-locked', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-lockednow.wav', 'conf-lockednow', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-muted.wav', 'conf-muted', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-noempty.wav', 'conf-noempty', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-onlyone.wav', 'conf-onlyone', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-onlyperson.wav', 'conf-onlyperson', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-otherinparty.wav', 'conf-otherinparty', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-placeintoconf.wav', 'conf-placeintoconf', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-thereare.wav', 'conf-thereare', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-unlockednow.wav', 'conf-unlockednow', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-unmuted.wav', 'conf-unmuted', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-usermenu.wav', 'conf-usermenu', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-userswilljoin.wav', 'conf-userswilljoin', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('conf-userwilljoin.wav', 'conf-userwilljoin', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('conf-waitforleader.wav', 'conf-waitforleader', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Cuiaba.wav', 'Cuiaba', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Curitiba.wav', 'Curitiba', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('de-activated.wav', 'de-activated', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-abouttotry.wav', 'demo-abouttotry', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-congrats.wav', 'demo-congrats', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-echodone.wav', 'demo-echodone', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-echotest.wav', 'demo-echotest', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-enterkeywords.wav', 'demo-enterkeywords', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-instruct.wav', 'demo-instruct', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-moreinfo.wav', 'demo-moreinfo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-nogo.wav', 'demo-nogo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-nomatch.wav', 'demo-nomatch', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('demo-thanks.wav', 'demo-thanks', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-instr.wav', 'dir-instr', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-intro-fn.wav', 'dir-intro-fn', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-intro-oper.wav', 'dir-intro-oper', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-intro.wav', 'dir-intro', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-nomatch.wav', 'dir-nomatch', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('dir-nomore.wav', 'dir-nomore', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Distrito-Federal.wav', 'Distrito-Federal', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('do-not-disturb.wav', 'do-not-disturb', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('ent-target-attendant.wav', 'ent-target-attendant', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Espirito-Santo.wav', 'Espirito-Santo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Exemplo.wav', 'Exemplo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('ext-disabled.wav', 'ext-disabled', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Florianopolis.wav', 'Florianopolis', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Fortaleza.wav', 'Fortaleza', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Goiania.wav', 'Goiania', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Goias.wav', 'Goias', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('hello-world.wav', 'hello-world', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('hour.wav', 'hour', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('hours.wav', 'hours', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('im-sorry.wav', 'im-sorry', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('incorrect-password.wav', 'incorrect-password', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('info-about-last-call.wav', 'info-about-last-call', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('invalid.wav', 'invalid', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('is-in-use.wav', 'is-in-use', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('is-set-to.wav', 'is-set-to', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('is.wav', 'is', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Joao-Pessoa.wav', 'Joao-Pessoa', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('location.wav', 'location', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Macapa.wav', 'Macapa', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Maceio.wav', 'Maceio', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('macroform-robot_dity.wav', 'macroform-robot_dity.wav', '2015-08-31 13:53:33', 'MOH', 'default', 'pt_BR'),
('macroform-the_simplicity.wav', 'macroform-the_simplicity.wav', '2015-08-31 13:53:33', 'MOH', 'default', 'pt_BR'),
('Manaus.wav', 'Manaus', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('manolo_camp-morning_coffee.wav', 'manolo_camp-morning_coffee.wav', '2015-08-31 13:53:33', 'MOH', 'default', 'pt_BR'),
('Maranhao.wav', 'Maranhao', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Mato-Grosso-do-Sul.wav', 'Mato-Grosso-do-Sul', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Mato-Grosso.wav', 'Mato-Grosso', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Minas-Gerais.wav', 'Minas-Gerais', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('minute.wav', 'minute', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('minutes.wav', 'minutes', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('morning.wav', 'morning', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Natal.wav', 'Natal', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('night.wav', 'night', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('no-rights.wav', 'no-rights', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('number.wav', 'number', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('one-moment-please.wav', 'one-moment-please', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Palmas.wav', 'Palmas', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Para.wav', 'Para', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Paraiba.wav', 'Paraiba', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Parana.wav', 'Parana', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pbx-invalid.wav', 'pbx-invalid', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pbx-invalidpark.wav', 'pbx-invalidpark', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pbx-transfer.wav', 'pbx-transfer', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Pernambuco.wav', 'Pernambuco', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('Piaui.wav', 'Piaui', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pls-try-call-later.wav', 'pls-try-call-later', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pm-invalid-option.wav', 'pm-invalid-option', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Porto-Alegre.wav', 'Porto-Alegre', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Porto-Velho.wav', 'Porto-Velho', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('pound.wav', 'pound', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('press-1.wav', 'press-1', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('press-2.wav', 'press-2', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('press-3.wav', 'press-3', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('press-star.wav', 'press-star', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('privacy-incorrect.wav', 'privacy-incorrect', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('privacy-prompt.wav', 'privacy-prompt', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('privacy-thankyou.wav', 'privacy-thankyou', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('privacy-unident.wav', 'privacy-unident', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-callswaiting.wav', 'queue-callswaiting', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-holdtime.wav', 'queue-holdtime', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-less-than.wav', 'queue-less-than', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-minutes.wav', 'queue-minutes', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-periodic-announce.wav', 'queue-periodic-announce', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-reporthold.wav', 'queue-reporthold', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-seconds.wav', 'queue-seconds', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-thankyou.wav', 'queue-thankyou', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-thereare.wav', 'queue-thereare', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('queue-youarenext.wav', 'queue-youarenext', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Real.wav', 'Real', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Recife.wav', 'Recife', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('reno_project-system.wav', 'reno_project-system.wav', '2015-08-31 13:53:33', 'MOH', 'default', 'pt_BR'),
('Rio-Branco.wav', 'Rio-Branco', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('Rio-de-Janeiro.wav', 'Rio-de-Janeiro', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Rio-Grande-do-Norte.wav', 'Rio-Grande-do-Norte', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Rio-Grande-do-Sul.wav', 'Rio-Grande-do-Sul', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Rondonia.wav', 'Rondonia', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Roraima.wav', 'Roraima', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('saida.wav', 'saida', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Salvador.wav', 'Salvador', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Santa-Catarina.wav', 'Santa-Catarina', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Sao-Luis.wav', 'Sao-Luis', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Sao-Paulo.wav', 'Sao-Paulo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('screen-callee-options.wav', 'screen-callee-options', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('seconds.wav', 'seconds', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('sec_opens.wav', 'sec_opens', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('sec_opens2.wav', 'sec_opens2', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Sergipe.wav', 'Sergipe', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('speed-dial-empty.wav', 'speed-dial-empty', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('speed-dial.wav', 'speed-dial', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('speed-enterlocation.wav', 'speed-enterlocation', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('speed-enternumber.wav', 'speed-enternumber', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('ss-noservice.wav', 'ss-noservice', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('star.wav', 'star', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('telephone-number.wav', 'telephone-number', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Teresina.wav', 'Teresina', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('then-press-pound.wav', 'then-press-pound', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('to-call-this-number.wav', 'to-call-this-number', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('to-change.wav', 'to-change', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('to-enter-a-diff.wav', 'to-enter-a-diff', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('to-listen-to-it.wav', 'to-listen-to-it', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('to-rerecord-it.wav', 'to-rerecord-it', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Tocantins.wav', 'Tocantins', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('tt-allbusy.wav', 'tt-allbusy', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('tt-monkeys.wav', 'tt-monkeys', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('tt-monkeysintro.wav', 'tt-monkeysintro', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('tt-somethingwrong.wav', 'tt-somethingwrong', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('tt-weasels.wav', 'tt-weasels', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('Vitoria.wav', 'Vitoria', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-advopts.wav', 'vm-advopts', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-and.wav', 'vm-and', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-calldiffnum.wav', 'vm-calldiffnum', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-changeto.wav', 'vm-changeto', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Cust1.wav', 'vm-Cust1', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Cust2.wav', 'vm-Cust2', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Cust3.wav', 'vm-Cust3', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Cust4.wav', 'vm-Cust4', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Cust5.wav', 'vm-Cust5', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-delete.wav', 'vm-delete', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-deleted.wav', 'vm-deleted', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-dialout.wav', 'vm-dialout', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-enter-num-to-call.wav', 'vm-enter-num-to-call', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-extension.wav', 'vm-extension', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Family.wav', 'vm-Family', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-first.wav', 'vm-first', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-for.wav', 'vm-for', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-forward.wav', 'vm-forward', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-forwardoptions.wav', 'vm-forwardoptions', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Friends.wav', 'vm-Friends', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-from-extension.wav', 'vm-from-extension', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-from-phonenumber.wav', 'vm-from-phonenumber', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-from.wav', 'vm-from', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-goodbye.wav', 'vm-goodbye', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-helpexit.wav', 'vm-helpexit', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-INBOX.wav', 'vm-INBOX', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-INBOXs.wav', 'vm-INBOXs', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-incorrect-mailbox.wav', 'vm-incorrect-mailbox', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-incorrect.wav', 'vm-incorrect', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-instructions.wav', 'vm-instructions', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-intro.wav', 'vm-intro', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-isonphone.wav', 'vm-isonphone', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-isunavail.wav', 'vm-isunavail', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-last.wav', 'vm-last', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-leavemsg.wav', 'vm-leavemsg', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-login.wav', 'vm-login', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-mailboxfull.wav', 'vm-mailboxfull', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-message.wav', 'vm-message', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-messages.wav', 'vm-messages', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-mismatch.wav', 'vm-mismatch', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-msginstruct.wav', 'vm-msginstruct', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-msgsaved.wav', 'vm-msgsaved', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-newpassword.wav', 'vm-newpassword', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-newuser.wav', 'vm-newuser', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-next.wav', 'vm-next', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-no.wav', 'vm-no', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-nobodyavail.wav', 'vm-nobodyavail', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-nobox.wav', 'vm-nobox', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-nomessages.wav', 'vm-nomessages', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-nomore.wav', 'vm-nomore', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-nonumber.wav', 'vm-nonumber', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-num-i-have.wav', 'vm-num-i-have', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Old.wav', 'vm-Old', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Olds.wav', 'vm-Olds', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-onefor.wav', 'vm-onefor', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-options.wav', 'vm-options', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-opts.wav', 'vm-opts', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-passchanged.wav', 'vm-passchanged', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-password.wav', 'vm-password', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-press.wav', 'vm-press', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-prev.wav', 'vm-prev', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-reachoper.wav', 'vm-reachoper', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-rec-busy.wav', 'vm-rec-busy', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-rec-name.wav', 'vm-rec-name', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-rec-temp.wav', 'vm-rec-temp', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-rec-unv.wav', 'vm-rec-unv', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-receive.wav', 'vm-receive', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-received.wav', 'vm-received', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('vm-receiveo.wav', 'vm-receiveo', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-reenterpassword.wav', 'vm-reenterpassword', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-repeat.wav', 'vm-repeat', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-review.wav', 'vm-review', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-saved.wav', 'vm-saved', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('vm-savedto.wav', 'vm-savedto', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-savefolder.wav', 'vm-savefolder', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-savemessage.wav', 'vm-savemessage', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-saveoper.wav', 'vm-saveoper', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-sorry.wav', 'vm-sorry', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-star-cancel.wav', 'vm-star-cancel', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('vm-starmain.wav', 'vm-starmain', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tempgreeting.wav', 'vm-tempgreeting', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('vm-tempgreeting2.wav', 'vm-tempgreeting2', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tempremoved.wav', 'vm-tempremoved', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-then-pound.wav', 'vm-then-pound', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-theperson.wav', 'vm-theperson', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tocallback.wav', 'vm-tocallback', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tocallnum.wav', 'vm-tocallnum', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tocancel.wav', 'vm-tocancel', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tocancelmsg.wav', 'vm-tocancelmsg', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-toenternumber.wav', 'vm-toenternumber', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-toforward.wav', 'vm-toforward', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tohearenv.wav', 'vm-tohearenv', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tomakecall.wav', 'vm-tomakecall', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-tooshort.wav', 'vm-tooshort', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-toreply.wav', 'vm-toreply', '2015-08-21 16:12:58', 'AST', '', 'pt_BR'),
('vm-torerecord.wav', 'vm-torerecord', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-undelete.wav', 'vm-undelete', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-undeleted.wav', 'vm-undeleted', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-unknown-caller.wav', 'vm-unknown-caller', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-whichbox.wav', 'vm-whichbox', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-Work.wav', 'vm-Work', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-youhave.wav', 'vm-youhave', '2015-08-21 16:12:57', 'AST', '', 'pt_BR'),
('vm-youhaveno.wav', 'vm-youhaveno', '2015-08-21 16:12:57', 'AST', '', 'pt_BR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `time_history`
--

CREATE TABLE `time_history` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner_type` char(1) NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `trunks`
--

CREATE TABLE `trunks` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `accountcode` varchar(20) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `context` varchar(80) DEFAULT NULL,
  `dtmfmode` varchar(7) DEFAULT NULL,
  `insecure` varchar(20) DEFAULT NULL,
  `secret` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `allow` varchar(100) DEFAULT 'g729;ilbc;gsm;ulaw;alaw',
  `channel` varchar(255) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `trunktype` char(1) NOT NULL,
  `host` varchar(31) DEFAULT NULL,
  `trunk_redund` int(11) DEFAULT NULL,
  `time_total` int(11) DEFAULT NULL,
  `time_chargeby` char(1) DEFAULT NULL,
  `time_initial_date` int(11) DEFAULT NULL,
  `dialmethod` varchar(6) NOT NULL DEFAULT 'NORMAL',
  `id_regex` varchar(255) DEFAULT NULL,
  `map_extensions` tinyint(1) DEFAULT '0',
  `reverse_auth` tinyint(1) DEFAULT '1',
  `dtmf_dial` tinyint(1) NOT NULL DEFAULT '0',
  `dtmf_dial_number` varchar(50) DEFAULT NULL,
  `domain` varchar(250) NOT NULL,
  `technology` varchar(20) NOT NULL,
  `telco` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dashboard` text NOT NULL,
  `profile_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `dashboard`, `profile_id`, `created`, `updated`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'suporte@opens.com.br', '', 1, '2025-01-11 05:40:34', '2025-01-11 05:40:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_permissions`
--

CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` varchar(256) NOT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_queues_permissions`
--

CREATE TABLE `users_queues_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `voicemail_messages`
--

CREATE TABLE `voicemail_messages` (
  `id` int(11) NOT NULL,
  `msgnum` int(11) NOT NULL DEFAULT '0',
  `dir` varchar(80) DEFAULT '',
  `context` varchar(80) DEFAULT '',
  `macrocontext` varchar(80) DEFAULT '',
  `callerid` varchar(40) DEFAULT '',
  `origtime` varchar(40) DEFAULT '',
  `duration` varchar(20) DEFAULT '',
  `mailboxuser` varchar(80) DEFAULT '',
  `mailboxcontext` varchar(80) DEFAULT '',
  `recording` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `voicemail_users`
--

CREATE TABLE `voicemail_users` (
  `uniqueid` int(11) NOT NULL,
  `customer_id` varchar(11) NOT NULL DEFAULT '0',
  `context` varchar(50) DEFAULT '',
  `mailbox` varchar(11) NOT NULL DEFAULT '0',
  `password` varchar(10) NOT NULL DEFAULT '0',
  `fullname` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `pager` varchar(50) DEFAULT '',
  `tz` varchar(10) NOT NULL DEFAULT 'central24',
  `attach` varchar(4) NOT NULL DEFAULT 'yes',
  `saycid` varchar(4) NOT NULL DEFAULT 'yes',
  `dialout` varchar(10) DEFAULT '',
  `callback` varchar(10) DEFAULT '',
  `review` varchar(4) NOT NULL DEFAULT 'no',
  `operator` varchar(4) NOT NULL DEFAULT 'no',
  `envelope` varchar(4) NOT NULL DEFAULT 'no',
  `sayduration` varchar(4) NOT NULL DEFAULT 'no',
  `saydurationm` tinyint(4) NOT NULL DEFAULT '1',
  `sendvoicemail` varchar(4) NOT NULL DEFAULT 'no',
  `delete` varchar(4) NOT NULL DEFAULT 'no',
  `nextaftercmd` varchar(4) NOT NULL DEFAULT 'yes',
  `forcename` varchar(4) NOT NULL DEFAULT 'no',
  `forcegreetings` varchar(4) NOT NULL DEFAULT 'no',
  `hidefromdir` varchar(4) NOT NULL DEFAULT 'yes',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ccustos`
--
ALTER TABLE `ccustos`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `cdr`
--
ALTER TABLE `cdr`
  ADD KEY `calldate` (`calldate`),
  ADD KEY `dst` (`dst`),
  ADD KEY `accountcode` (`accountcode`),
  ADD KEY `cdr_clid` (`clid`(30)),
  ADD KEY `cdr_src` (`src`(30)),
  ADD KEY `cdr_dst` (`dst`(30)),
  ADD KEY `cdr_dcontext` (`dcontext`(30)),
  ADD KEY `cdr_channel` (`channel`(30)),
  ADD KEY `cdr_dstchannel` (`dstchannel`(50)),
  ADD KEY `cdr_lastapp` (`lastapp`(30)),
  ADD KEY `cdr_lastdata` (`lastdata`(50)),
  ADD KEY `cdr_disposition` (`disposition`(30)),
  ADD KEY `cdr_accountcode` (`accountcode`),
  ADD KEY `cdr_uniqueid` (`uniqueid`),
  ADD KEY `cdr_userfield` (`userfield`(120));

--
-- Índices de tabela `contacts_group`
--
ALTER TABLE `contacts_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contacts_names`
--
ALTER TABLE `contacts_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_group_fk` (`group`);

--
-- Índices de tabela `contacts_phone`
--
ALTER TABLE `contacts_phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Índices de tabela `core_binds`
--
ALTER TABLE `core_binds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peer_name` (`peer_name`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `core_binds_exceptions`
--
ALTER TABLE `core_binds_exceptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `core_city`
--
ALTER TABLE `core_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_city_5654bf12` (`state_id`);

--
-- Índices de tabela `core_cnl_city`
--
ALTER TABLE `core_cnl_city`
  ADD PRIMARY KEY (`id`,`state`),
  ADD KEY `state` (`state`);

--
-- Índices de tabela `core_cnl_country`
--
ALTER TABLE `core_cnl_country`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `core_cnl_prefix`
--
ALTER TABLE `core_cnl_prefix`
  ADD PRIMARY KEY (`id`,`country`),
  ADD KEY `city` (`city`),
  ADD KEY `country` (`country`);

--
-- Índices de tabela `core_cnl_state`
--
ALTER TABLE `core_cnl_state`
  ADD PRIMARY KEY (`id`,`country`),
  ADD KEY `country` (`country`);

--
-- Índices de tabela `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `core_country`
--
ALTER TABLE `core_country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `core_groups`
--
ALTER TABLE `core_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `core_notifications`
--
ALTER TABLE `core_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `core_peer_groups`
--
ALTER TABLE `core_peer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `peer_id` (`peer_id`);

--
-- Índices de tabela `core_state`
--
ALTER TABLE `core_state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acronym` (`acronym`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `core_state_d860be3c` (`country_id`);

--
-- Índices de tabela `date_alias`
--
ALTER TABLE `date_alias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `date_alias_list`
--
ALTER TABLE `date_alias_list`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `expr_alias`
--
ALTER TABLE `expr_alias`
  ADD PRIMARY KEY (`aliasid`);

--
-- Índices de tabela `expr_alias_expression`
--
ALTER TABLE `expr_alias_expression`
  ADD KEY `aliasid` (`aliasid`);

--
-- Índices de tabela `grupos`
--
ALTER TABLE `grupos`
  ADD UNIQUE KEY `cod_grupo` (`cod_grupo`);

--
-- Índices de tabela `itc_register`
--
ALTER TABLE `itc_register`
  ADD PRIMARY KEY (`uuid`);

--
-- Índices de tabela `password_recovery`
--
ALTER TABLE `password_recovery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `peers`
--
ALTER TABLE `peers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`),
  ADD KEY `pickupgroup` (`pickupgroup`);

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `profiles_permissions`
--
ALTER TABLE `profiles_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Índices de tabela `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Índices de tabela `queue_log`
--
ALTER TABLE `queue_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_log_time` (`time`),
  ADD KEY `queue_log_callid` (`callid`),
  ADD KEY `queue_log_queuename` (`queuename`),
  ADD KEY `queue_log_agent` (`agent`),
  ADD KEY `queue_log_event` (`event`);

--
-- Índices de tabela `queue_members`
--
ALTER TABLE `queue_members`
  ADD PRIMARY KEY (`uniqueid`),
  ADD UNIQUE KEY `queue_interface` (`queue_name`,`interface`);

--
-- Índices de tabela `queue_peers`
--
ALTER TABLE `queue_peers`
  ADD PRIMARY KEY (`ramal`,`fila`);

--
-- Índices de tabela `registry`
--
ALTER TABLE `registry`
  ADD PRIMARY KEY (`context`,`key`);

--
-- Índices de tabela `regras_negocio`
--
ALTER TABLE `regras_negocio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `regras_negocio_actions`
--
ALTER TABLE `regras_negocio_actions`
  ADD PRIMARY KEY (`regra_id`,`prio`);

--
-- Índices de tabela `regras_negocio_actions_config`
--
ALTER TABLE `regras_negocio_actions_config`
  ADD PRIMARY KEY (`regra_id`,`prio`,`key`);

--
-- Índices de tabela `sounds`
--
ALTER TABLE `sounds`
  ADD PRIMARY KEY (`arquivo`,`tipo`,`secao`,`language`);

--
-- Índices de tabela `time_history`
--
ALTER TABLE `time_history`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `trunks`
--
ALTER TABLE `trunks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Índices de tabela `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `users_queues_permissions`
--
ALTER TABLE `users_queues_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_user_p` (`user_id`),
  ADD KEY `fk_id_queue_p` (`queue_id`);

--
-- Índices de tabela `voicemail_messages`
--
ALTER TABLE `voicemail_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dir` (`dir`);

--
-- Índices de tabela `voicemail_users`
--
ALTER TABLE `voicemail_users`
  ADD PRIMARY KEY (`uniqueid`),
  ADD KEY `mailbox_context` (`mailbox`,`context`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contacts_group`
--
ALTER TABLE `contacts_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `contacts_names`
--
ALTER TABLE `contacts_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacts_phone`
--
ALTER TABLE `contacts_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_binds`
--
ALTER TABLE `core_binds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_binds_exceptions`
--
ALTER TABLE `core_binds_exceptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_city`
--
ALTER TABLE `core_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_cnl_city`
--
ALTER TABLE `core_cnl_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_country`
--
ALTER TABLE `core_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_groups`
--
ALTER TABLE `core_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `core_notifications`
--
ALTER TABLE `core_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_peer_groups`
--
ALTER TABLE `core_peer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_state`
--
ALTER TABLE `core_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `date_alias`
--
ALTER TABLE `date_alias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `date_alias_list`
--
ALTER TABLE `date_alias_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `expr_alias`
--
ALTER TABLE `expr_alias`
  MODIFY `aliasid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `grupos`
--
ALTER TABLE `grupos`
  MODIFY `cod_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `password_recovery`
--
ALTER TABLE `password_recovery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `peers`
--
ALTER TABLE `peers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `profiles_permissions`
--
ALTER TABLE `profiles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `queues`
--
ALTER TABLE `queues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `queue_log`
--
ALTER TABLE `queue_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `queue_members`
--
ALTER TABLE `queue_members`
  MODIFY `uniqueid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `regras_negocio`
--
ALTER TABLE `regras_negocio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `time_history`
--
ALTER TABLE `time_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `trunks`
--
ALTER TABLE `trunks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users_permissions`
--
ALTER TABLE `users_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users_queues_permissions`
--
ALTER TABLE `users_queues_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `voicemail_messages`
--
ALTER TABLE `voicemail_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `voicemail_users`
--
ALTER TABLE `voicemail_users`
  MODIFY `uniqueid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contacts_names`
--
ALTER TABLE `contacts_names`
  ADD CONSTRAINT `contacts_group_fk` FOREIGN KEY (`group`) REFERENCES `contacts_group` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `contacts_phone`
--
ALTER TABLE `contacts_phone`
  ADD CONSTRAINT `contacts_phone_refs_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts_names` (`id`);

--
-- Restrições para tabelas `core_binds`
--
ALTER TABLE `core_binds`
  ADD CONSTRAINT `binds_peer_refs_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `binds_refs_peer_name` FOREIGN KEY (`peer_name`) REFERENCES `peers` (`name`);

--
-- Restrições para tabelas `core_binds_exceptions`
--
ALTER TABLE `core_binds_exceptions`
  ADD CONSTRAINT `binds_peer_refs_user_id_exception` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `core_cnl_city`
--
ALTER TABLE `core_cnl_city`
  ADD CONSTRAINT `core_cnl_city_ibfk_1` FOREIGN KEY (`state`) REFERENCES `core_cnl_state` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `core_cnl_prefix`
--
ALTER TABLE `core_cnl_prefix`
  ADD CONSTRAINT `core_cnl_prefix_ibfk_1` FOREIGN KEY (`city`) REFERENCES `core_cnl_city` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `core_cnl_prefix_ibfk_2` FOREIGN KEY (`country`) REFERENCES `core_cnl_country` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `core_cnl_state`
--
ALTER TABLE `core_cnl_state`
  ADD CONSTRAINT `core_cnl_state_ibfk_1` FOREIGN KEY (`country`) REFERENCES `core_cnl_country` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `core_peer_groups`
--
ALTER TABLE `core_peer_groups`
  ADD CONSTRAINT `core_peer_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `core_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `core_peer_groups_ibfk_2` FOREIGN KEY (`peer_id`) REFERENCES `peers` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `expr_alias_expression`
--
ALTER TABLE `expr_alias_expression`
  ADD CONSTRAINT `expr_alias_expression_ibfk_1` FOREIGN KEY (`aliasid`) REFERENCES `expr_alias` (`aliasid`) ON DELETE CASCADE;

--
-- Restrições para tabelas `password_recovery`
--
ALTER TABLE `password_recovery`
  ADD CONSTRAINT `password_recovery_refs_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `peers`
--
ALTER TABLE `peers`
  ADD CONSTRAINT `peers_ibfk_1` FOREIGN KEY (`pickupgroup`) REFERENCES `grupos` (`cod_grupo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `profiles_permissions`
--
ALTER TABLE `profiles_permissions`
  ADD CONSTRAINT `fk_user_profiles` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`);

--
-- Restrições para tabelas `regras_negocio_actions`
--
ALTER TABLE `regras_negocio_actions`
  ADD CONSTRAINT `regras_negocio_actions_ibfk_1` FOREIGN KEY (`regra_id`) REFERENCES `regras_negocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `regras_negocio_actions_config`
--
ALTER TABLE `regras_negocio_actions_config`
  ADD CONSTRAINT `regras_negocio_actions_config_ibfk_1` FOREIGN KEY (`regra_id`,`prio`) REFERENCES `regras_negocio_actions` (`regra_id`, `prio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`);

--
-- Restrições para tabelas `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD CONSTRAINT `fk_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `users_queues_permissions`
--
ALTER TABLE `users_queues_permissions`
  ADD CONSTRAINT `fk_id_queue_p` FOREIGN KEY (`queue_id`) REFERENCES `queues` (`id`),
  ADD CONSTRAINT `fk_id_user_p` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
