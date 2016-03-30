
use cholulamun;

-- ActivityInstance [ActivityInstance]
create table `activityinstance` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `status`  varchar(255),
   `ready_since`  datetime,
   `active_since`  datetime,
   `completed_at`  datetime,
   `aborted_at`  datetime,
   `cancelled_at`  datetime,
   `worked_at`  datetime,
   `rollbackable`  bit,
   `context`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_activityinstance_status` on `activityinstance`(`status`);


-- ActivityType [ActivityType]
create table `activitytype` (
   `oid`  integer  not null,
   `id`  varchar(255),
   `code`  varchar(255),
   `name`  varchar(255),
   `default_instance_name`  varchar(255),
   `description`  longtext,
   `type`  varchar(255),
   `execution`  varchar(255),
   `sort_number`  double precision,
   `uuid`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_activitytype_type` on `activitytype`(`type`);
create index `idx_activitytype_execution` on `activitytype`(`execution`);
create index `idx_activitytype_uuid` on `activitytype`(`uuid`);


-- Attachment [Attachment]
create table `attachment` (
   `oid`  integer  not null,
   `file`  varchar(255),
   `title`  varchar(255),
   `timestamp`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
   `moduledomainname`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Note [Note]
create table `note` (
   `oid`  integer  not null,
   `text`  longtext,
   `timestamp`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Notification [Notification]
create table `notification` (
   `oid`  integer  not null,
   `message`  varchar(255),
   `read`  bit,
  primary key (`oid`)
) ENGINE=InnoDB;


-- ParameterInstance [ParameterInstance]
create table `parameterinstance` (
   `oid`  integer  not null,
   `value`  varchar(255),
   `current`  bit,
   `timestamp`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_parameterinstance_current` on `parameterinstance`(`current`);


-- ParameterType [ParameterType]
create table `parametertype` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `description`  varchar(255),
   `type`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_parametertype_name` on `parametertype`(`name`);


-- Process [Process]
create table `process` (
   `oid`  integer  not null,
   `code`  varchar(255),
   `name`  varchar(255),
   `default_instance_name`  varchar(255),
   `description`  longtext,
   `uuid`  varchar(255),
   `version`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_process_uuid` on `process`(`uuid`);


-- ProcessInstance [ProcessInstance]
create table `processinstance` (
   `oid`  integer  not null,
   `name`  varchar(255),
   `subprocessindex`  integer,
   `status`  varchar(255),
   `active_since`  datetime,
   `completed_at`  datetime,
   `cancelled_at`  datetime,
   `aborted_at`  datetime,
  primary key (`oid`)
) ENGINE=InnoDB;
create index `idx_processinstance_status` on `processinstance`(`status`);


-- SequenceFlow [SequenceFlow]
create table `sequenceflow` (
   `oid`  integer  not null,
   `label`  varchar(255),
   `condition`  varchar(255),
   `default`  bit,
   `sort_number`  double precision,
  primary key (`oid`)
) ENGINE=InnoDB;


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CHOLULA-Validaciones [ent1]
create table `cholula_validaciones` (
   `oid`  integer  not null,
   `esta_completa_la_informacion`  varchar(255),
   `observaciones`  longtext,
   `procede`  varchar(255),
   `observaciones_de_licencia_de_c`  longtext,
   `procede_sin_inspeccion`  varchar(255),
   `fecha_y_hora_confirmada`  varchar(255),
   `cumple`  varchar(255),
   `es_competencia_de_ecologia_mun`  varchar(255),
   `se_requiere_dictamen_ecologico`  varchar(255),
   `esta_completa_la_documentacion`  varchar(255),
   `esta_al_corriente_en_los_pagos`  varchar(255),
   `el_uso_de_suelo_es_compatible`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ALNO-TO-FAG-DPC-CCNX-AVF-Fecha y hora de visita [ent10]
create table `alno_to_fag_dpc_ccnx_avf_fecha` (
   `oid`  integer  not null,
   `fecha_y_hora`  date,
   `comentarios_adicionales`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- ALNO-Observaciones de inspeccion [ent11]
create table `alno_observaciones_de_inspecci` (
   `oid`  integer  not null,
   `observaciones`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- ALNO-LUS-FAG-Superficies [ent12]
create table `alno_lus_fag_superficies` (
   `oid`  integer  not null,
   `superficie_de_terreno`  decimal(19,2),
   `superficie_a_ocupar`  decimal(19,2),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ALNO-Croquis [ent13]
create table `alno_croquis` (
   `oid`  integer  not null,
   `croquis`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Tipo de suelo [ent14]
create table `avf_tipo_de_suelo` (
   `oid`  integer  not null,
   `tipo_de_suelo`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Superficie cartografica y legal [ent15]
create table `avf_superficie_cartografica_y` (
   `oid`  integer  not null,
   `superficie_cartografica`  longtext,
   `superficie_legal`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Responsable [ent16]
create table `avf_responsable` (
   `oid`  integer  not null,
   `nombre_de_responsable`  varchar(255),
   `folio_de_pago`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Requisitos [ent17]
create table `avf_requisitos` (
   `oid`  integer  not null,
   `tipo_identificacion_oficial`  varchar(255),
   `documento`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Reporte fotografico y ubicacion [ent18]
create table `avf_reporte_fotografico_y_ubic` (
   `oid`  integer  not null,
   `croquis_de_ubicacion`  varchar(255),
   `fotografia_1`  varchar(255),
   `fotografia_2`  varchar(255),
   `fotografia_3`  varchar(255),
   `fotografia_4`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Predios urbanos y suburbanos [ent19]
create table `avf_predios_urbanos_y_suburban` (
   `oid`  integer  not null,
   `tipo_de_zona`  varchar(255),
   `superficie_del_predio`  varchar(255),
   `frente`  decimal(19,2),
   `profundidad`  decimal(19,2),
   `superficie_legal`  varchar(255),
   `valor_provicional_m2`  decimal(19,2),
   `interes_social`  varchar(255),
   `esquina`  varchar(255),
   `lote_interior`  varchar(255),
   `topografia`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CHOLULA-Expediente electronico [ent2]
create table `cholula_expediente_electronico` (
   `oid`  integer  not null,
   `identificacion_oficial_con_fot`  varchar(255),
   `documento_que_acreedite_la_pro`  varchar(255),
   `fotografia_frontal_del_predio`  varchar(255),
   `fotografia_posterior_del_predi`  varchar(255),
   `carnet_del_drom`  varchar(255),
   `proyecto_arquitectonico_estruc`  varchar(255),
   `memoria_de_calculo`  varchar(255),
   `bitacora_de_obra`  varchar(255),
   `proyecto_autorizado_por_la_adm`  varchar(255),
   `constancia_de_alineamiento_y_n`  varchar(255),
   `constancia_de_terminacion_de_o`  varchar(255),
   `licencia_de_fraccionamientos`  varchar(255),
   `ficha_informativa_emitida_por`  varchar(255),
   `plano_aprobado_de_las_casas`  varchar(255),
   `plano_aprobado_de_fraccionamie`  varchar(255),
   `plano_aprobado_por_el_area_de`  varchar(255),
   `tabla_de_indivisos`  varchar(255),
   `dictamen_de_c_n_a_y_proteccion`  varchar(255),
   `dictamen_de_integracion_de_via`  varchar(255),
   `dictamen_del_inah`  varchar(255),
   `levantamiento_topografico`  varchar(255),
   `licencia_de_construccion_y_rec`  varchar(255),
   `licencia_de_uso_de_suelo`  varchar(255),
   `informe_preventivo_de_impacto`  varchar(255),
   `aviso_de_terminacion_de_obra_a`  varchar(255),
   `contratacion_de_los_servicios`  varchar(255),
   `proyecto_arquitectonico_autori`  varchar(255),
   `disposicion_final_de_residuos`  varchar(255),
   `fotografia_interior_1`  varchar(255),
   `fotografia_interior_2`  varchar(255),
   `fotografia_exterior_1`  varchar(255),
   `fotografia_exterior_2`  varchar(255),
   `constancia_de_cumplimiento_de`  varchar(255),
   `constancia_de_terminacion_de_3`  varchar(255),
   `plantas_arquitectonicas`  varchar(255),
   `factibilidad_de_agua_y_drenaje`  varchar(255),
   `ejemplo_cuestionario_de_inform`  varchar(255),
   `cuestionario_de_informe_preven`  varchar(255),
   `licencia_de_uso_de_suelo_espec`  varchar(255),
   `plano_de_proyecto`  varchar(255),
   `fotografia_1`  varchar(255),
   `fotografia_2`  varchar(255),
   `fotografia_3`  varchar(255),
   `fotografia_4`  varchar(255),
   `contrato`  varchar(255),
   `alineamiento_y_numero_oficial`  varchar(255),
   `factibilidad`  varchar(255),
   `plano_de_ubicacion_y_colindanc`  varchar(255),
   `plano_de_ubicacion_y_distribuc`  varchar(255),
   `programa_interno`  varchar(255),
   `oficio_emitido_por_desarrollo`  varchar(255),
   `plano_arquitectonico`  varchar(255),
   `poliza_de_seguro`  varchar(255),
   `constancia_de_primeros_auxilio`  varchar(255),
   `constancia_manejo_de_extintore`  varchar(255),
   `constancia_de_soldadura_en_cas`  varchar(255),
   `constancia_de_trabajos_de_altu`  varchar(255),
   `hojas_de_seguridad_de_oxigeno`  varchar(255),
   `fotografias_de_se_aletica_y_eq`  varchar(255),
   `fotografia_2_de_se_aletica_y_e`  varchar(255),
   `fotografia_3_de_se_aletica_y_e`  varchar(255),
   `dictamen_de_proteccion_civil`  varchar(255),
   `constancia_de_medidas_preventi`  varchar(255),
   `escrituras`  varchar(255),
   `en_caso_de_ser_personal_moral`  varchar(255),
   `contrato_de_conexion`  varchar(255),
   `comprobante_domicilio_no_mayor`  varchar(255),
   `fotografia_interna`  varchar(255),
   `fotografia_externa`  varchar(255),
   `croquis`  varchar(255),
   `constancia_primeros_auxilios_e`  varchar(255),
   `aviso_de_salubridad_en_caso_de`  varchar(255),
   `traslado_de_dominio`  varchar(255),
   `avaluo`  varchar(255),
   `escritura_publica`  varchar(255),
   `pago_de_isabi`  varchar(255),
   `constancia_de_no_adeudo_predia`  varchar(255),
   `licencia_de_funcionamiento_con`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Observaciones del avaluo [ent20]
create table `avf_observaciones_del_avaluo` (
   `oid`  integer  not null,
   `observaciones`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Motivo [ent21]
create table `avf_motivo` (
   `oid`  integer  not null,
   `localidad`  varchar(255),
   `motivo`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Documento de propiedad [ent22]
create table `avf_documento_de_propiedad` (
   `oid`  integer  not null,
   `t_d`  integer,
   `numero_de_escritura_o_titulo`  varchar(255),
   `fecha`  date,
   `fedatario`  integer,
   `numero_de_la_notaria`  integer,
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Datos del solicitante [ent23]
create table `avf_datos_del_solicitante` (
   `oid`  integer  not null,
   `tipo_de_interesado`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `rfc`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Datos del propietario [ent24]
create table `avf_datos_del_propietario` (
   `oid`  integer  not null,
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Datos de construcciones [ent25]
create table `avf_datos_de_construcciones` (
   `oid`  integer  not null,
   `bloque`  varchar(255),
   `tipo`  varchar(255),
   `estado`  varchar(255),
   `avance_de_obra`  varchar(255),
   `edad`  decimal(19,2),
   `niveles`  integer,
   `sup_m2`  decimal(19,2),
   `demerito`  varchar(255),
   `observaciones`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Datos adicionales [ent26]
create table `avf_datos_adicionales` (
   `oid`  integer  not null,
   `tipo_de_posesion`  varchar(255),
   `regimen_de_propiedad`  varchar(255),
   `tenencia`  varchar(255),
   `estado_fisico`  varchar(255),
   `destino_de_uso`  varchar(255),
   `exento`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Coordenadas UTM [ent27]
create table `avf_coordenadas_utm` (
   `oid`  integer  not null,
   `referencia`  varchar(255),
   `x`  integer,
   `y`  integer,
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Clave catastral [ent28]
create table `avf_clave_catastral` (
   `oid`  integer  not null,
   `municipio`  varchar(255),
   `region`  varchar(255),
   `manzana`  varchar(255),
   `predio`  varchar(255),
   `condominio`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- AVF-Clave catastral de origen [ent29]
create table `avf_clave_catastral_de_origen` (
   `oid`  integer  not null,
   `region`  varchar(255),
   `manzana`  varchar(255),
   `predio`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-ALNO-TO-LUS-FAG-DPC-Datos del solicitante [ent3]
create table `lcfc_alno_to_lus_fag_dpc_datos` (
   `oid`  integer  not null,
   `tipo_de_interesado`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `rfc`  varchar(255),
   `telefono_particular`  varchar(255),
   `telefono_celular`  varchar(255),
   `correo_electronico`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-TO-FAG-CCNX-SARE-Requisitos [ent30]
create table `lcfc_to_fag_ccnx_sare_requisit` (
   `oid`  integer  not null,
   `tipo_identificacion_oficial`  varchar(255),
   `identificacion_oficial`  varchar(255),
   `acta_constitutiva_en_caso_de_s`  varchar(255),
   `carta_poder_en_caso_de_no_ser`  varchar(255),
   `contrato_de_arrendamiento_y_o`  varchar(255),
   `comprobante_domicilio_del_come`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- FAG-CCNX-Vista de inspeccion [ent31]
create table `fag_ccnx_vista_de_inspeccion` (
   `oid`  integer  not null,
   `orden_de_inspeccion`  varchar(255),
   `acta_de_inspeccion`  varchar(255),
   `observaciones`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- FAG-CCNX-Domicilio del solicitante [ent32]
create table `fag_ccnx_domicilio_del_solicit` (
   `oid`  integer  not null,
   `estado`  varchar(255),
   `municipio`  varchar(255),
   `poblacion`  varchar(255),
   `colonia`  varchar(255),
   `codigo_postal`  varchar(255),
   `calle`  varchar(255),
   `entre_calle`  varchar(255),
   `y_calle`  varchar(255),
   `numero_exterior`  varchar(255),
   `numero_interior`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- FAG-CCNX-Datos generales del servicio [ent33]
create table `fag_ccnx_datos_generales_del_s` (
   `oid`  integer  not null,
   `superficie_total`  decimal(19,2),
   `superficie_construida`  decimal(19,2),
   `cuenta_con_red_de_agua_potable`  varchar(255),
   `distancia_en_metros_agua`  decimal(19,2),
   `cuenta_con_red_de_drenaje`  varchar(255),
   `distancia_en_metros_drenaje`  decimal(19,2),
  primary key (`oid`)
) ENGINE=InnoDB;


-- FAG-CCNX-Caracteristicas del predio [ent34]
create table `fag_ccnx_caracteristicas_del_p` (
   `oid`  integer  not null,
   `tipo_de_zona`  varchar(255),
   `tipo_de_toma_o_descarga`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Suministro de agua [ent35]
create table `ccnx_suministro_de_agua` (
   `oid`  integer  not null,
   `fuentes_abastecedoras`  varchar(255),
   `reportes_de_cna_en_caso_de_poz`  varchar(255),
   `recibos_de_pago_en_caso_red_mu`  varchar(255),
   `facturas_en_caso_de_pipas`  varchar(255),
   `volumen_de_agua_utilizado_en_m`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Servicio [ent36]
create table `ccnx_servicio` (
   `oid`  integer  not null,
   `clasificacion`  varchar(255),
   `observaciones`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Recibo actual de pago de agua y-o drenaje [ent37]
create table `ccnx_recibo_actual_de_pago_de` (
   `oid`  integer  not null,
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `estado`  varchar(255),
   `codigo_postal`  varchar(255),
   `numero_de_cuenta`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Propietario, representante o encargado de la empresa [ent38]
create table `ccnx_propietario_representante` (
   `oid`  integer  not null,
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `estado`  varchar(255),
   `municipio`  varchar(255),
   `calle`  varchar(255),
   `numero_exterior`  varchar(255),
   `numero_interior`  varchar(255),
   `codigo_postal`  varchar(255),
   `telefono_particular`  varchar(255),
   `telefono_celular`  varchar(255),
   `correo_electronico`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Orden de conexion [ent39]
create table `ccnx_orden_de_conexion` (
   `oid`  integer  not null,
   `toma`  integer,
   `numero_de_medidor`  varchar(255),
   `fecha_de_conexion`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CHOLULA-Pago [ent4]
create table `cholula_pago` (
   `oid`  integer  not null,
   `donacion_de_arboles`  varchar(255),
   `monto_a_pagar`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Empresa [ent40]
create table `ccnx_empresa` (
   `oid`  integer  not null,
   `nombre`  varchar(255),
   `calle_exterior`  varchar(255),
   `numero_exterior`  varchar(255),
   `colonia`  varchar(255),
   `junta_auxiliar`  varchar(255),
   `codigo_postal`  varchar(255),
   `inicio_de_operacion`  date,
   `telefono`  varchar(255),
   `r_f_c`  varchar(255),
   `razon_social`  varchar(255),
   `giro`  varchar(255),
   `numero_de_empleados_permanente`  integer,
   `numero_de_personal_temporal`  integer,
   `area_total_del_predio`  varchar(255),
   `area_total_cubierta`  varchar(255),
   `area_de_servicio_al_publico`  varchar(255),
   `numero_de_mesas`  integer,
   `observaciones`  longtext,
   `area_de_generacion_de_descarga`  varchar(255),
   `numero_de_descarga_s`  varchar(255),
   `periodo_de_servicio_de_saneami`  varchar(255),
   `fecha_de_servicio_de_saneamien`  date,
   `periodo_del_servicio_de_drenaj`  varchar(255),
   `fecha_del_servicio_de_drenaje`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Datos de la solicitud [ent41]
create table `ccnx_datos_de_la_solicitud` (
   `oid`  integer  not null,
   `numero_de_solicitud`  varchar(255),
   `solicitud_para`  varchar(255),
   `requerido_para`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Conexion de los servicios [ent42]
create table `ccnx_conexion_de_los_servicios` (
   `oid`  integer  not null,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CCNX-Actividad empresa [ent43]
create table `ccnx_actividad_empresa` (
   `oid`  integer  not null,
   `especificacion_de_areas_genera`  longtext,
   `sitio_de_descarga`  varchar(255),
   `especificar_otro`  varchar(255),
   `croquis_de_ubicacionde_descarg`  varchar(255),
   `descripcion_del_proceso_y_o_ac`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- CNAP-Datos del solicitante [ent44]
create table `cnap_datos_del_solicitante` (
   `oid`  integer  not null,
   `tipo_de_interesado`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `rfc`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CNAP-Datos del predio [ent45]
create table `cnap_datos_del_predio` (
   `oid`  integer  not null,
   `denominacion`  varchar(255),
   `superficie_de_terreno`  varchar(255),
   `superficie_de_construcion`  varchar(255),
   `base_gravable`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CNAP-Adeudo [ent46]
create table `cnap_adeudo` (
   `oid`  integer  not null,
   `adeudo_pendiente`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-TO-DPC-DRO [ent47]
create table `lcfc_to_dpc_dro` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `titulo_drom`  varchar(255),
   `numero_de_cedula`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `telefono_particular`  varchar(255),
   `telefono_celular`  varchar(255),
   `correo_electronico`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- DPC-Requisitos [ent48]
create table `dpc_requisitos` (
   `oid`  integer  not null,
   `ife_del_representante`  varchar(255),
   `rfc_del_representante`  varchar(255),
   `carta_de_entrega_del_programa`  varchar(255),
   `carta_de_responsabilidad_corre`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- DPC-Datos de la construccion [ent49]
create table `dpc_datos_de_la_construccion` (
   `oid`  integer  not null,
   `nombre_o_tipo_de_obra`  varchar(255),
   `programa`  date,
   `nombre_fiscal`  varchar(255),
   `cargo`  varchar(255),
   `poblacion_fija`  varchar(255),
   `poblacon_flotante`  varchar(255),
   `descripcion_de_actividad_comer`  varchar(255),
   `niveles_total`  integer,
   `elevadores`  integer,
   `estacionamiento`  integer,
   `superficie_total`  decimal(19,2),
   `superficie_construida`  decimal(19,2),
   `antiguedad`  decimal(19,2),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CHOLULA-Predial [ent5]
create table `cholula_predial` (
   `oid`  integer  not null,
   `cuenta_predial`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- DPC-Criterios de inspeccion [ent50]
create table `dpc_criterios_de_inspeccion` (
   `oid`  integer  not null,
   `datos_generales`  varchar(255),
   `riesgos_internos`  varchar(255),
   `observaciones_internos`  varchar(255),
   `riesgos_externos`  varchar(255),
   `observaciones_externos`  varchar(255),
   `directorio_de_los_grupos_opera`  varchar(255),
   `observaciones_emergencia`  varchar(255),
   `listado_del_personal_que_labor`  varchar(255),
   `observaciones_personal`  varchar(255),
   `inventario_de_equipo_de_seguri`  varchar(255),
   `observaciones_seguridad`  varchar(255),
   `inventario_de_los_extintores`  varchar(255),
   `observaciones_extintores`  varchar(255),
   `croquis`  varchar(255),
   `observaciones_croquis`  varchar(255),
   `plano_de_ubicacion_de_la_obra`  varchar(255),
   `observaciones_obra_y_colindanc`  varchar(255),
   `plano_de_ubicacion_y_distribuc`  varchar(255),
   `observaciones_se_aletica`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- FAG-Factibilidad [ent51]
create table `fag_factibilidad` (
   `oid`  integer  not null,
   `estatus`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Oficios [ent52]
create table `isab_oficios` (
   `oid`  integer  not null,
   `oficio_de_no_procedencia`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos solicitud [ent53]
create table `isab_datos_solicitud` (
   `oid`  integer  not null,
   `fecha_solicitud`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos propiedad [ent54]
create table `isab_datos_propiedad` (
   `oid`  integer  not null,
   `tipo_predio`  varchar(255),
   `fecha_de_la_firma`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos del registro publico [ent55]
create table `isab_datos_del_registro_public` (
   `oid`  integer  not null,
   `tomo_de_libro`  varchar(255),
   `numero_de_tomo`  integer,
   `indice_de_predio`  varchar(255),
   `partida`  varchar(255),
   `inscripcion`  varchar(255),
   `fojas`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos del fedatario [ent56]
create table `isab_datos_del_fedatario` (
   `oid`  integer  not null,
   `numero_de_notaria`  integer,
   `apellido_paterno`  varchar(255),
   `apellido_materno`  varchar(255),
   `nombre_s`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos de la operacion [ent57]
create table `isab_datos_de_la_operacion` (
   `oid`  integer  not null,
   `tipo_de_operacion`  varchar(255),
   `valor_catastral`  decimal(19,2),
   `valor_de_la_operacion`  decimal(19,2),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos de identificacion del enajenante [ent58]
create table `isab_datos_de_identificacion_d` (
   `oid`  integer  not null,
   `tipo_de_persona`  varchar(255),
   `rfc_moral_curp_fisica`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ISAB-Datos de identificacion del adquiriente [ent59]
create table `isab_datos_de_identificacion_2` (
   `oid`  integer  not null,
   `tipo_de_persona`  varchar(255),
   `rfc_moral_curp_fisica`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- CHOLULA-Control [ent6]
create table `cholula_control` (
   `oid`  integer  not null,
   `folio_de_ingreso`  varchar(255),
   `folio_de_control`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Ubicacion [ent60]
create table `lcfc_ubicacion` (
   `oid`  integer  not null,
   `fraccionamiento`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Proyecto final [ent61]
create table `lcfc_proyecto_final` (
   `oid`  integer  not null,
   `imagenes_autorizada_1`  varchar(255),
   `imagenes_autorizadas_2`  varchar(255),
   `imagenes_autorizadas_3`  varchar(255),
   `imagenes_autorizadas_4`  varchar(255),
   `imagenes_autorizadas_5`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Observaciones ALNO [ent62]
create table `lcfc_observaciones_alno` (
   `oid`  integer  not null,
   `alineamiento_y_numero_oficial`  longtext,
   `uso_de_suelo`  longtext,
   `licencia_de_construccion`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-LUS-Coeficientes [ent63]
create table `lcfc_lus_coeficientes` (
   `oid`  integer  not null,
   `programa`  varchar(255),
   `zona_tipo`  varchar(255),
   `tipos_de_uso_primario`  varchar(255),
   `tipo_de_uso_secundario`  varchar(255),
   `uso_especifico`  varchar(255),
   `comptabilidad`  varchar(255),
   `cos`  decimal(19,2),
   `cus`  decimal(19,2),
   `cos_aplicado`  decimal(19,2),
   `cus_aplicado`  decimal(19,2),
   `vigencia_de_uso_de_suelo`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Localizacion [ent64]
create table `lcfc_localizacion` (
   `oid`  integer  not null,
   `localizacion`  varchar(255),
   `via_publica`  varchar(255),
   `numero_oficial`  integer,
   `vigencia_de_alineamiento`  date,
   `croquis`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Domicilio del predio [ent65]
create table `lcfc_domicilio_del_predio` (
   `oid`  integer  not null,
   `fraccionamiento`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Datos de la construccion [ent66]
create table `lcfc_datos_de_la_construccion` (
   `oid`  integer  not null,
   `sotano`  decimal(19,2),
   `planta_baja`  decimal(19,2),
   `t1er_nivel`  decimal(19,2),
   `t2do_nivel`  decimal(19,2),
   `total_construccion`  decimal(19,2),
   `vigencia_de_licencia`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Aviso [ent67]
create table `lcfc_aviso` (
   `oid`  integer  not null,
   `aviso`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-Documentos oficiales [ent68]
create table `lcfc_documentos_oficiales` (
   `oid`  integer  not null,
   `resolutivo`  varchar(255),
   `alineamiento_y_numero_oficial`  varchar(255),
   `constancia_de_agua_potable_y_d`  varchar(255),
   `licencia_de_uso_de_suelo`  varchar(255),
   `dictamen_de_informe_ecologico`  varchar(255),
   `licencia_de_construccion_de_ob`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LUS-Vigencia [ent69]
create table `lus_vigencia` (
   `oid`  integer  not null,
   `vigencia_de_alineamiento`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-ALNO-LUS-FAG-CCNX-CNAP-Datos del propietario [ent7]
create table `lcfc_alno_lus_fag_ccnx_cnap_da` (
   `oid`  integer  not null,
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `rfc`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LUS-Requerimientos ecologicos [ent70]
create table `lus_requerimientos_ecologicos` (
   `oid`  integer  not null,
   `requerimientos`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LUS-Datos del establecimiento [ent71]
create table `lus_datos_del_establecimiento` (
   `oid`  integer  not null,
   `plaza_comercial`  varchar(255),
   `tipo_de_giro`  varchar(255),
   `nombre_del_proyecto`  varchar(255),
   `mesas`  integer,
   `personas`  integer,
  primary key (`oid`)
) ENGINE=InnoDB;


-- LUS-Condicionantes [ent72]
create table `lus_condicionantes` (
   `oid`  integer  not null,
   `condicionantes`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Tipo de persona [ent73]
create table `sare_tipo_de_persona` (
   `oid`  integer  not null,
   `tipo_de_persona`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Terminos y condiciones [ent74]
create table `sare_terminos_y_condiciones` (
   `oid`  integer  not null,
   `estoy_de_acuerdo_en_que_cumplo`  varchar(255),
   `me_comprometo_a_obtener_el_dic`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Oficios [ent75]
create table `sare_oficios` (
   `oid`  integer  not null,
   `oficio_de_no_procedencia_y_no`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Medidas preventivas [ent76]
create table `sare_medidas_preventivas` (
   `oid`  integer  not null,
   `lineamientos`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Establecimiento [ent77]
create table `sare_establecimiento` (
   `oid`  integer  not null,
   `actividad_o_giro`  varchar(255),
   `clave_de_giro`  varchar(255),
   `denominacion_comercial`  varchar(255),
   `colonia`  varchar(255),
   `codigo_postal`  varchar(255),
   `calle`  varchar(255),
   `entre_calle`  varchar(255),
   `y_calle`  varchar(255),
   `numero_exterior`  varchar(255),
   `numero_interior`  varchar(255),
   `inversion_aproximada`  varchar(255),
   `numero_de_empleados`  varchar(255),
   `inicio_de_operaciones`  date,
   `superficie_m2_del_establecimie`  varchar(255),
   `local`  varchar(255),
   `renta`  varchar(255),
   `estacionamiento`  varchar(255),
   `observaciones`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- SARE-Datos del solicitante [ent78]
create table `sare_datos_del_solicitante` (
   `oid`  integer  not null,
   `tipo_de_interesado`  varchar(255),
   `primer_apellido`  varchar(255),
   `segundo_apellido`  varchar(255),
   `nombres_s`  varchar(255),
   `rfc`  varchar(255),
   `telefono_particular`  varchar(255),
   `telefono_celular`  varchar(255),
   `correo_electronico`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Informe ecologico preventivo [ent79]
create table `to_informe_ecologico_preventiv` (
   `oid`  integer  not null,
   `proyecto`  varchar(255),
   `comentarios`  longtext,
   `cuenta_con_areas_abiertas_con`  varchar(255),
   `cuenta_con_area_verde_requerid`  varchar(255),
   `cuenta_con_banco_de_tiro_autor`  varchar(255),
   `cuenta_con_accesorios_y_mueble`  varchar(255),
   `existe_material_de_residuos_de`  varchar(255),
   `cuenta_con_los_arboles_requeri`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- LCFC-ALNO-LUS-FAG-AVF-ISAB-Medidas y colindancias [ent8]
create table `lcfc_alno_lus_fag_avf_isab_med` (
   `oid`  integer  not null,
   `orientacion`  varchar(255),
   `medida`  decimal(19,2),
   `colindancia`  longtext,
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Informe de terminacion de obra [ent80]
create table `to_informe_de_terminacion_de_o` (
   `oid`  integer  not null,
   `de_avance_de_carpinteria_cance`  integer,
   `de_acabados_exteriores`  integer,
   `cuenta_con_puertas_y_ventanas`  varchar(255),
   `funciona_la_instalacion_electr`  varchar(255),
   `funciona_la_instalacion_hidro`  varchar(255),
   `funciona_la_instalacion_de_gas`  varchar(255),
   `es_habitable_el_inmueble`  varchar(255),
   `corresponde_con_proyecto_autor`  varchar(255),
   `esta_cerrada_y_firmada_la_bita`  varchar(255),
   `esta_habitado_el_inmuebles_en`  varchar(255),
   `existen_da_os_a_la_via_publica`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de seguridad estructural [ent81]
create table `to_corresposable_de_seguridad` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de restauracion [ent82]
create table `to_corresposable_de_restauraci` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de instalaciones mecanicas [ent83]
create table `to_corresposable_de_instalacio` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de instalaciones electricas [ent84]
create table `to_corresposable_de_instalac_2` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de instalaciones de gas [ent85]
create table `to_corresposable_de_instalac_3` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de hidraulicas y sanitarias [ent86]
create table `to_corresposable_de_hidraulica` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresposable de dise–o urbano y arquitectonico [ent87]
create table `to_corresposable_de_dise_o_urb` (
   `oid`  integer  not null,
   `registro_municipal`  varchar(255),
   `numero_de_cedula`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Corresponsable(s) [ent88]
create table `to_corresponsable_s` (
   `oid`  integer  not null,
   `tipo`  varchar(255),
   `numero_de_cedula`  varchar(255),
   `registro_municipal`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Condicionantes y documentos adicionales [ent89]
create table `to_condicionantes_y_documentos` (
   `oid`  integer  not null,
   `documento`  varchar(255),
   `archivo_anexo`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ALNO-TO-LUS-FAG-DPC-CCNX-AVF-ISAB-CNAP-Domicilio del predio [ent9]
create table `alno_to_lus_fag_dpc_ccnx_avf_i` (
   `oid`  integer  not null,
   `clave_catastral`  varchar(255),
   `calle_exterior`  varchar(255),
   `numero_exterior`  varchar(255),
   `numero_interior`  varchar(255),
   `letra`  varchar(255),
   `fraccionamiento`  varchar(255),
   `colonia`  varchar(255),
   `codigo_postal`  varchar(255),
   `lote`  varchar(255),
   `manzana`  varchar(255),
   `junta_auxiliar`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Antecedentes [ent90]
create table `to_antecedentes` (
   `oid`  integer  not null,
   `no_de_licencia_de_construccion`  varchar(255),
   `vigencia`  date,
   `fecha_de_ingreso_de_t_o`  date,
   `tiempo_transcurrido_entre_vige`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Dictaminacion del informa ecologico [ent91]
create table `to_dictaminacion_del_informa_e` (
   `oid`  integer  not null,
   `nombre_del_proyecto`  varchar(255),
   `resolucion`  varchar(255),
   `acciones_faltantes`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- TO-Documentos oficiales [ent92]
create table `to_documentos_oficiales` (
   `oid`  integer  not null,
   `licencia_de_construccion_y_rec`  varchar(255),
   `licencia_de_uso_de_suelo`  varchar(255),
   `informe_preventivo_de_impacto`  varchar(255),
   `aviso_de_terminacion_de_obra_a`  varchar(255),
   `contratacion_de_los_servicios`  varchar(255),
   `proyecto_arquitectonico_autori`  varchar(255),
   `disposicion_final_de_residuos`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- ActivityInstance_CandidateUser [ActivityInstance_CandidateUser]
create table `activityinstance_candidateuser` (
   `activityinstance_oid`  integer not null,
   `user_oid`  integer not null,
  primary key (`activityinstance_oid`, `user_oid`)
) ENGINE=InnoDB;
alter table `activityinstance_candidateuser`   add index fk_activityinstance_candidat_2 (`activityinstance_oid`), add constraint fk_activityinstance_candidat_2 foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);
alter table `activityinstance_candidateuser`   add index fk_activityinstance_candidateu (`user_oid`), add constraint fk_activityinstance_candidateu foreign key (`user_oid`) references `user` (`oid`);


-- ActivityInstance_Group [ActivityInstance_Group]
alter table `activityinstance`  add column  `group_oid`  integer;
alter table `activityinstance`   add index fk_activityinstance_group (`group_oid`), add constraint fk_activityinstance_group foreign key (`group_oid`) references `group` (`oid`);


-- ActivityInstance_NextActivityInstanceNotes [ActivityInstance_NextActivityInstanceNotes]
alter table `note`  add column  `activityinstance_oid`  integer;
alter table `note`   add index fk_note_activityinstance (`activityinstance_oid`), add constraint fk_note_activityinstance foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);


-- ActivityInstance_Notification [ActivityInstance_Notifications]
alter table `notification`  add column  `activityinstance_oid`  integer;
alter table `notification`   add index fk_notification_activityinstan (`activityinstance_oid`), add constraint fk_notification_activityinstan foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);


-- ActivityType_ActivityInstance [ActivityType_ActivityInstance]
alter table `activityinstance`  add column  `activitytype_oid`  integer;
alter table `activityinstance`   add index fk_activityinstance_activityty (`activitytype_oid`), add constraint fk_activityinstance_activityty foreign key (`activitytype_oid`) references `activitytype` (`oid`);


-- Attachment_ProcessInstance [Attachment_ProcessInstance]
create table `attachment_processinstance` (
   `attachment_oid`  integer not null,
   `processinstance_oid`  integer not null,
  primary key (`attachment_oid`, `processinstance_oid`)
) ENGINE=InnoDB;
alter table `attachment_processinstance`   add index fk_attachment_processinstance (`attachment_oid`), add constraint fk_attachment_processinstance foreign key (`attachment_oid`) references `attachment` (`oid`);
alter table `attachment_processinstance`   add index fk_attachment_processinstanc_2 (`processinstance_oid`), add constraint fk_attachment_processinstanc_2 foreign key (`processinstance_oid`) references `processinstance` (`oid`);


-- Attachment_User [Attachment_User]
alter table `attachment`  add column  `user_oid`  integer;
alter table `attachment`   add index fk_attachment_user (`user_oid`), add constraint fk_attachment_user foreign key (`user_oid`) references `user` (`oid`);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
) ENGINE=InnoDB;
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_ActivityType [Group_ActivityType]
create table `group_activitytype` (
   `group_oid`  integer not null,
   `activitytype_oid`  integer not null,
  primary key (`group_oid`, `activitytype_oid`)
) ENGINE=InnoDB;
alter table `group_activitytype`   add index fk_group_activitytype_group (`group_oid`), add constraint fk_group_activitytype_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_activitytype`   add index fk_group_activitytype_activity (`activitytype_oid`), add constraint fk_group_activitytype_activity foreign key (`activitytype_oid`) references `activitytype` (`oid`);


-- NextActivityType_PreviousSequenceFlow [NextActivityType_PreviousSequenceFlow]
alter table `sequenceflow`  add column  `activitytype_oid`  integer;
alter table `sequenceflow`   add index fk_sequenceflow_activitytype_2 (`activitytype_oid`), add constraint fk_sequenceflow_activitytype_2 foreign key (`activitytype_oid`) references `activitytype` (`oid`);


-- Note_ActivityInstance [Note_ActivityInstance]
create table `note_activityinstance` (
   `note_oid`  integer not null,
   `activityinstance_oid`  integer not null,
  primary key (`note_oid`, `activityinstance_oid`)
) ENGINE=InnoDB;
alter table `note_activityinstance`   add index fk_note_activityinstance_note (`note_oid`), add constraint fk_note_activityinstance_note foreign key (`note_oid`) references `note` (`oid`);
alter table `note_activityinstance`   add index fk_note_activityinstance_activ (`activityinstance_oid`), add constraint fk_note_activityinstance_activ foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);


-- Note_ProcessInstance [Note_ProcessInstance]
create table `note_processinstance` (
   `note_oid`  integer not null,
   `processinstance_oid`  integer not null,
  primary key (`note_oid`, `processinstance_oid`)
) ENGINE=InnoDB;
alter table `note_processinstance`   add index fk_note_processinstance_note (`note_oid`), add constraint fk_note_processinstance_note foreign key (`note_oid`) references `note` (`oid`);
alter table `note_processinstance`   add index fk_note_processinstance_proces (`processinstance_oid`), add constraint fk_note_processinstance_proces foreign key (`processinstance_oid`) references `processinstance` (`oid`);


-- Note_User [Note_User]
alter table `note`  add column  `user_oid`  integer;
alter table `note`   add index fk_note_user (`user_oid`), add constraint fk_note_user foreign key (`user_oid`) references `user` (`oid`);


-- ParameterInstance_ActivityInstance [ParameterInstance_ActivityInstance]
alter table `parameterinstance`  add column  `activityinstance_oid`  integer;
alter table `parameterinstance`   add index fk_parameterinstance_activityi (`activityinstance_oid`), add constraint fk_parameterinstance_activityi foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);


-- ParameterType_ParameterInstance [ParameterType_ParameterInstance]
alter table `parameterinstance`  add column  `parametertype_oid`  integer;
alter table `parameterinstance`   add index fk_parameterinstance_parameter (`parametertype_oid`), add constraint fk_parameterinstance_parameter foreign key (`parametertype_oid`) references `parametertype` (`oid`);


-- PreviousActivityInstance_NextActivityInstance [PreviousActivityInstance_NextActivityInstance]
create table `previousactivityinstance_nexta` (
   `activityinstance_oid_2`  integer not null,
   `activityinstance_oid`  integer not null,
  primary key (`activityinstance_oid_2`, `activityinstance_oid`)
) ENGINE=InnoDB;
alter table `previousactivityinstance_nexta`   add index fk_previousactivityinstance_ne (`activityinstance_oid_2`), add constraint fk_previousactivityinstance_ne foreign key (`activityinstance_oid_2`) references `activityinstance` (`oid`);
alter table `previousactivityinstance_nexta`   add index fk_previousactivityinstance_2 (`activityinstance_oid`), add constraint fk_previousactivityinstance_2 foreign key (`activityinstance_oid`) references `activityinstance` (`oid`);


-- PreviousActivityType_NextSequenceFlow [PreviousActivityType_NextSequenceFlow]
alter table `sequenceflow`  add column  `activitytype_oid_2`  integer;
alter table `sequenceflow`   add index fk_sequenceflow_activitytype (`activitytype_oid_2`), add constraint fk_sequenceflow_activitytype foreign key (`activitytype_oid_2`) references `activitytype` (`oid`);


-- ProcessInstance_ActivityInstance [ProcessInstance_ActivityInstance]
alter table `activityinstance`  add column  `processinstance_oid`  integer;
alter table `activityinstance`   add index fk_activityinstance_processins (`processinstance_oid`), add constraint fk_activityinstance_processins foreign key (`processinstance_oid`) references `processinstance` (`oid`);


-- ProcessInstance_ParameterInstance [ProcessInstance_ParameterInstance]
alter table `parameterinstance`  add column  `processinstance_oid`  integer;
alter table `parameterinstance`   add index fk_parameterinstance_processin (`processinstance_oid`), add constraint fk_parameterinstance_processin foreign key (`processinstance_oid`) references `processinstance` (`oid`);


-- ProcessInstance_Process [ProcessInstance_Process]
alter table `processinstance`  add column  `process_oid`  integer;
alter table `processinstance`   add index fk_processinstance_process (`process_oid`), add constraint fk_processinstance_process foreign key (`process_oid`) references `process` (`oid`);


-- Process_ActivityType [Process_ActivityType]
alter table `activitytype`  add column  `process_oid`  integer;
alter table `activitytype`   add index fk_activitytype_process (`process_oid`), add constraint fk_activitytype_process foreign key (`process_oid`) references `process` (`oid`);


-- Process_ParameterType [Process_ParameterType]
alter table `parametertype`  add column  `process_oid`  integer;
alter table `parametertype`   add index fk_parametertype_process (`process_oid`), add constraint fk_parametertype_process foreign key (`process_oid`) references `process` (`oid`);


-- SubprocessInstances_ParentProcessInstance [SubprocessInstances_ParentProcessInstance]
alter table `processinstance`  add column  `processinstance_oid`  integer;
alter table `processinstance`   add index fk_processinstance_processinst (`processinstance_oid`), add constraint fk_processinstance_processinst foreign key (`processinstance_oid`) references `processinstance` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
) ENGINE=InnoDB;
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- User_ActivityInstance [User_ActivityInstance]
alter table `activityinstance`  add column  `user_oid`  integer;
alter table `activityinstance`   add index fk_activityinstance_user (`user_oid`), add constraint fk_activityinstance_user foreign key (`user_oid`) references `user` (`oid`);


-- User_Notifications [User_Notifications]
create table `user_notifications` (
   `user_oid`  integer not null,
   `notification_oid`  integer not null,
  primary key (`user_oid`, `notification_oid`)
) ENGINE=InnoDB;
alter table `user_notifications`   add index fk_user_notifications_user (`user_oid`), add constraint fk_user_notifications_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_notifications`   add index fk_user_notifications_notifica (`notification_oid`), add constraint fk_user_notifications_notifica foreign key (`notification_oid`) references `notification` (`oid`);


-- ProcessInstance.attachment count [processInstanceAttachmentCount]
create view `processinstance_attachment_cou` as
select AL1.`oid` as `oid`, count(distinct AL2.`attachment_oid`) as `der_attr`
from  `processinstance` AL1 
               left outer join `attachment_processinstance` AL2 on AL1.`oid`=AL2.`processinstance_oid`
group by AL1.`oid`;


