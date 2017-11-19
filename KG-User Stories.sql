Go
CREATE PROC Job_save_score
    @seeker_username VARCHAR(20),
    @job_applied_for VARCHAR(20),
    @department int,
    @company VARCHAR(100),
    @score int
AS
    UPDATE Job_Seekers_Apply_Jobs
    SET score = @score 
    WHERE job = @job_applied_for AND department = @department AND company = @company AND @job_seeker=seeker_username
